# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_packagename=VeloxDB
_gitauthor=veloxbase
_gitname=veloxdb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, memory-efficient, developer-focused desktop SQL client"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://veloxdb.dev/"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'glib2' 'cairo' 'libsoup3' 'zlib' 'gtk3' 'gdk-pixbuf2' 'dbus' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('5b27f44e3e8ea19eaf7f0cc4697659a7f614e243cf91be81c6af21f8535644a4'
            '51c7b772f15a83ac914c7c506fb6efa05b19ec0f340f9c1b5ef67fbaa4317e56')
sha256sums_x86_64=('2640d48f6967b68f61f72f90ffb276d7630b2f0f08063dfbbc01125da0f51859')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	sed -e "s|Categories=|Categories=Development;|g" -e "s|Name=.*|Name=${_packagename}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
