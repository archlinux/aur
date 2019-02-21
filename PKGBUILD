# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: xpt <user.xpt@gmail.com>
_pkgname=lammps
pkgname=${_pkgname}-beta
pkgver=8Feb19
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator."
url="http://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
optdepends=('kim-api: support for OpenKIM potentials')
conflicts=('lammps')
source=(http://lammps.sandia.gov/tars/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('9c0155f09da140cc2d2f5c887a52a13b494719a8180bdbcb650165ccbec0d84524d66276347279902afb8023c159a1127b1a4defa29d271200cd155a54f7f6c8')
build() {
  cd ${_pkgname}-${pkgver}
  mkdir -p build; cd build
  cmake ../cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" #\
        #-DPKG_KIM=yes # KIM package
        # Add options for additional packages
        #-DPKG_<NAME>=yes
  make
}

package() {
  cd ${_pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
