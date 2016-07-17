# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=lepton
pkgver=1.0
pkgrel=2
pkgdesc="Tool and file format for losslessly compressing JPEGs"
arch=('i686' 'x86_64')
url="https://github.com/dropbox/lepton"
license=('APACHE')
makedepends=('cmake')
source=($pkgname-$pkgver::$url/archive/$pkgver.tar.gz
        $pkgname-correct-header.patch::$url/commit/5856187c0358411ae9fadc66a49de070382bf694.patch
        $pkgname-install-target.patch::$url/commit/eef6394493a69c4b04643a7ebf28e3c5a8e53e2b.patch)
md5sums=('f16f95418689ca63bff936cb3140192c'
         'c0e463550a94ceb0f4621ce61da6f307'
         'a4dc3604766dbf4af65d72b90cdbafa0')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../$pkgname-correct-header.patch
  patch -p1 -i ../$pkgname-install-target.patch
}

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
