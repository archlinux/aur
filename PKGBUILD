# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=andi
pkgver=0.14
pkgrel=1
pkgdesc="Rapid estimation of evolutionary distances"
url="https://github.com/evolbioinf/andi/"
license=("GPL3") # "custom:ISC" "custom:CC-BY 4.0"
depends=("libdivsufsort" "gsl")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae48cea10bfb008f89b7ac5cc06ea9ffa005716c12ac58922f33d1bf12da89ac')

prepare() {
	cd "${pkgname}-${pkgver}"
}

check() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-unit-tests --with-seed=123
	make
	make check
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
