# Maintainer: pingplug < aur at pingplug dot me >

_commit=83c6264f9929991bcf2918514114d19efe308e2a
_pkgname=SOEM

pkgname=soem
pkgver=1.4.0.r76.g83c6264
pkgrel=1
pkgdesc="Simple Open EtherCAT Master Library"
arch=('x86_64')
url="https://openethercatsociety.github.io/doc/soem"
license=('GPL-2.0-only')
makedepends=('cmake' 'git')
depends=()
source=("git+https://github.com/OpenEtherCATsociety/SOEM.git#commit=${_commit}")
options=('!lto')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}" make install
}
