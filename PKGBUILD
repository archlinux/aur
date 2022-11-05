# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Danibspi danibspi <at> gmail <dot> com

pkgname=bcunit
pkgver=3.0.2+12+g3c720fb
_commit=3c720fbf67dd3c02b0c7011ed4036982b2c93532
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
