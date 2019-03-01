# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: xpt <user.xpt@gmail.com>
_pkgname=lammps
pkgname=${_pkgname}-beta
_pkgver=28Feb2019
pkgver=20190208
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator."
url="http://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
optdepends=('kim-api: support for OpenKIM potentials')
conflicts=('lammps')
provides=('lammps')
source=(https://github.com/${_pkgname}/${_pkgname}/archive/patch_${_pkgver}.tar.gz)
sha512sums=('dc264ec43a5a917a0a7905f89076c2e10e8d5613bb710fb970eb388721860d7d409db7d988803bde823ddd74691c4b3bdf5bf4a72713476dad5a4b0833a4dbd0')
build() {
  cd "${_pkgname}-patch_${_pkgver}"
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
  cd "${_pkgname}-patch_${_pkgver}/build"
  make DESTDIR="$pkgdir" install
}
