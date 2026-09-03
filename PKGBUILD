# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_packagename=AngKorGit
_gitauthor=cheat2001
_gitname=angkorgit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, fast, beautiful open-source Git client"

pkgver=0.9.0
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
sha256sums=('7b316d111730e3eca8f6dd2f91cbd86ee6465966367a0f2672399ea881e63d56'
            'e2e20cd37ca31853f05df3cfdc3053208ead8f26279cea442fb6930bd4cc59fe')
sha256sums_x86_64=('caeecf349a83cf94739cb3a31ac96f1f40fd6812760c978edb8448875d27beb6')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
