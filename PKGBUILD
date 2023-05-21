# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.6.0
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
url='https://neper.info'
license=('GPL')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(https://github.com/rquey/neper/archive/v${pkgver}.tar.gz)

sha256sums=('3239962a4bb420a8baefa4d28e584c1278dc678b2ef28754700633647bda1ce0')

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src  -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install || return 1
}
