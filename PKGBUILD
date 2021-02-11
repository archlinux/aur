# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.1.2
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
license=('GPL')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(https://github.com/rquey/neper/archive/v${pkgver}.tar.gz)

sha256sums=('418be28dd14b75d009be63f8510c1fae24f1f017daabd6fa8215b9e2b22f5e3f')

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src  -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install || return 1
}
