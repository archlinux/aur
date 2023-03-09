# Maintainer: Holger Obermaier <holgerob@gmx.de>
# Contributor: Kasei Wang <kasei@kasei.im>

pkgname=powercap
pkgver=0.6.0
pkgrel=2
pkgdesc='C bindings to the Linux Power Capping Framework in sysfs'
arch=('x86_64')
url='https://github.com/powercap/powercap'
license=('custom:BSD')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/powercap/${pkgname}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build && cd ./build
  cmake .. -DBUILD_SHARED_LIBS=On \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make DESTDIR=$pkgdir install
}
