# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=andi
pkgver=0.13
pkgrel=1
pkgdesc="Rapid estimation of evolutionary distances"
url="https://github.com/evolbioinf/andi/"
license=("GPL3") # "custom:ISC" "custom:CC-BY 4.0"
depends=("libdivsufsort" "gsl")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('03e493ee22b6773a600b47cbfb121f4c2affd6e646ea16dad0d322e9276b3943')

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
