# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=puemos
_gitname=lareview
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The code review workbench"

pkgver=0.0.38
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo' 'libsoup3' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE-MIT" "LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('4d2aeefa296e3807ff06feb034207907dabc7281ddfcf2d97c97f4575cce05e4'
            'f07118dec05cd4d1b23459e754d7b8ccd948d3ef851aa558ddb46154a67594cd'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('1dd305d8e8b4ceb04bd31e13a7a6139efda0c267b343624fc0a5e081391ad19a')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${srcdir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
