# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_packagename=VeloxDB
_gitauthor=veloxbase
_gitname=veloxdb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, memory-efficient, developer-focused desktop SQL client"

pkgver=0.3.1
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
sha256sums=('74de5bd34f54a52d6096461a8b96dcda74489bb07103ab39c0152fbaf8ab2a09'
            '51c7b772f15a83ac914c7c506fb6efa05b19ec0f340f9c1b5ef67fbaa4317e56')
sha256sums_x86_64=('cf57c945e3d99180d6b1e8e3ab62e342f87f9318e3eecc72c822952cdbd75a72')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	sed -e "s|Categories=|Categories=Development;|g" -e "s|Name=.*|Name=${_packagename}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
