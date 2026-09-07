# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=neper
pkgver=5.0.0
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
url='https://neper.info'
license=('GPL-3.0-only')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=("https://github.com/neperfepx/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bbde52738ea6222c25bf9077a8529b43c187d21fdf47ca39a16d86aae8f47fb9cb7ea5aac463cbc65dc15789f4307e68802969939783d0459bd28d851ffeee12')

build() {
  cmake -S "${pkgname}-${pkgver}"/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  make -C build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
