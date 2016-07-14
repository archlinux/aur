# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=lepton
pkgver=1.0
pkgrel=1
pkgdesc="Tool and file format for losslessly compressing JPEGs"
arch=('i686' 'x86_64')
url="https://github.com/dropbox/lepton"
license=('APACHE')
makedepends=('cmake' 'git' 'libvpx')
#depends=()
source=($pkgname-$pkgver::$url/archive/$pkgver.tar.gz
        $pkgname-correct-header.patch::$url/commit/5856187c0358411ae9fadc66a49de070382bf694.patch)
md5sums=('f16f95418689ca63bff936cb3140192c'
         'c0e463550a94ceb0f4621ce61da6f307')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../$pkgname-correct-header.patch
}

build() {
  cd $pkgname-$pkgver
  git init
  cmake -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 lepton $pkgdir/usr/bin/lepton
  install -Dm755 lepton-avx $pkgdir/usr/bin/lepton-avx
  install -Dm755 test_invariants $pkgdir/usr/bin/test_invariants
}
