# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Danibspi danibspi <at> gmail <dot> com

pkgname=bcunit
pkgver=5.2.0+4+g0e0faa2
_commit=0e0faa2bd876784f78ff446d617b8ee8e40bceab
pkgrel=1
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(x86_64)
url="https://github.com/BelledonneCommunications/bcunit"
license=(LGPL)
depends=(glibc)
makedepends=(cmake git)
#source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/$pkgver.tar.gz")
source=(git+https://gitlab.linphone.org/BC/public/bcunit.git#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DOC=ON \
    -DENABLE_STATIC=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
