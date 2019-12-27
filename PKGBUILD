# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=hubrelease
pkgver=0.1.2
pkgrel=0
pkgdesc="Automatically create GitHub releases"
arch=('any')
url="https://github.com/MarkusGordathian/hubrelease"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'jansson' 'libgit2')
makedepengs=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MarkusGordathian/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b79658fbe55a9433e4dcea2a9b8c8210a41be3f5efc428e6bc4bf2235cee7c1b6ef01764a88f76a772914b427e2aaf5a31eb652e00d50e3cec02201e9bad9588')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}
