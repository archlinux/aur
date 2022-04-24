# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.4.1
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

sha256sums=('8310efbc12e66f2308ebddbeaa125982e68a97d853f221bab500dd62860ffeaa')

build() {
    cmake -B build -S "${pkgname}-${pkgver}"/src  -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="$pkgdir/" install || return 1
}
