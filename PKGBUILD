# Maintainer: pingplug < aur at pingplug dot me >

_commit=219670218b78acf4e4a96da70d36eeb9fc7f96ca
_pkgname=SOEM

pkgname=soem
pkgver=v1.4.0+45+g2196702
pkgrel=1
pkgdesc="Simple Open EtherCAT Master Library"
arch=('x86_64')
url="https://openethercatsociety.github.io/doc/soem"
license=('GPL2')
makedepends=('cmake' 'git')
depends=()
source=("git+https://github.com/OpenEtherCATsociety/SOEM.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/+/g'
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
