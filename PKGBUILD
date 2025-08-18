# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Danibspi danibspi <at> gmail <dot> com

pkgname=bcunit
pkgver=5.4.37
#_commit=6ca58a7ca673d23c2dd4ef2dd107743785d2b7f9
pkgrel=1
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(x86_64)
url="https://gitlab.linphone.org/BC/public/bcunit"
license=(LGPL)
depends=(glibc)
makedepends=(cmake git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/refs/tags/$pkgver.tar.gz")
#source=(git+https://gitlab.linphone.org/BC/public/bcunit.git#commit=$_commit)
sha256sums=('SKIP')

#pkgver() {
#  cd $pkgname-$pkgver
#  git describe --tags | sed 's/-/+/g'
#}

prepare() {
  mkdir -p $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DOC=ON \
    -DENABLE_STATIC=OFF
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
