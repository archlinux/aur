# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=libm2k-git
pkgver=0.8.0.r46.gb9123a3
pkgrel=1
pkgdesc='A C++ library (bindings for Python and C#) for interfacing with the ADALM2000'
arch=(x86_64)
url='https://github.com/analogdevicesinc/libm2k'
license=(LGPL-2.1-or-later)
depends=(python libiio)
makedepends=(swig cmake git python-setuptools)
provides=(libm2k)
conflicts=(libm2k)
source=("git+https://github.com/analogdevicesinc/libm2k.git")
sha256sums=('SKIP')

pkgver() {
  cd libm2k
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "libm2k" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

