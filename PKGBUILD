# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Samuel Walladge <samuel@swalladge.id.au>

pkgname=toggldesktop-latest-bin
_pkgname=toggldesktop
pkgver=7.4.358 
pkgrel=1
pkgdesc="Time Tracking Software."
arch=('x86_64')
provides=('toggldesktop')
conflicts=('toggldesktop')
depends=('libxss'
		 'openssl')
url='https://toggl.com/'
source=("https://github.com/toggl/toggldesktop/releases/download/v"${pkgver}"/toggldesktop_linux_x86_64-${pkgver//./_}.tar.gz"
		'toggldesktop.bin')

sha256sums=('27625585cbbd39c423c4e02b734eaca99a64b6facf8ed21f79e09c9de05e96ea'
            'fb19e902bb9b8ac22967147e9889cd1ae7820af462225524c54a56e2026d17b9')

package() {
	mkdir -p "${pkgdir}"/opt/toggldesktop/
	for dir in bin lib
	do
	 	cp -a "${srcdir}"/"${dir}" "${pkgdir}"/opt/toggldesktop/
  	done

  	mkdir "${pkgdir}"/usr -p
  	cp -a "${srcdir}"/share "${pkgdir}"/usr

  	find "${pkgdir}" -type d -exec chmod 0755 {} \;
  	find "${pkgdir}" -type f -exec chmod 0644 {} \;

  	chmod +x "${pkgdir}"/opt/toggldesktop/bin/TogglDesktop
  	chmod +x "${pkgdir}"/opt/toggldesktop/bin/QtWebEngineProcess
  	install -D -m 0755 toggldesktop.bin "${pkgdir}"/usr/bin/toggldesktop
}
