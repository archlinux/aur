# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.5.0
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

sha256sums=('db80dd89e02207e9b056b05fb9fbe493199ce7c3736b2039104c595b4dcd02a9')

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src  -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install || return 1
}
