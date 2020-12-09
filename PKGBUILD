# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.1.1
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
license=('GPL')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(https://neper.info/tarballs/neper-${pkgver}.tgz)

sha256sums=('67b0bb33c450605e07ee634fac39bbc380f49c0d47a91957f3fbb211637b247b')

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src  -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install || return 1
}
