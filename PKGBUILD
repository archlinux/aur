# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_packagename=AngKorGit
_gitauthor=cheat2001
_gitname=angkorgit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, fast, beautiful open-source Git client"

pkgver=0.13.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://angkorgit.app/"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
depends=('git' 'glibc' 'libgcc' 'glib2' 'cairo' 'libsoup3' 'zlib' 'gtk3' 'gdk-pixbuf2' 'dbus' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_packagename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('1fab7331511bdadda585218708c377005612eb85cd2e3c65821ff95816aca308'
            'e2e20cd37ca31853f05df3cfdc3053208ead8f26279cea442fb6930bd4cc59fe')
sha256sums_x86_64=('bf5f932503c5030fb4a2ffacba041b140f023bc383cdbc1277d2b991db6d85c0')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
