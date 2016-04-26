# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc
pkgver=0.3.3
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
makedepends=('cmake' 'ninja')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dvidelabs/$pkgname/tar.gz/v$pkgver)
sha256sums=('14903f53536947295214f7c1537b6ff933565453a440e610f0b85c3fb3fe6642')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./scripts/build.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 *.md doc/* -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  find bin -mindepth 1 -maxdepth 1 -type f -exec \
    install -Dm 755 -t "$pkgdir/usr/bin" '{}' +
  find lib -mindepth 1 -maxdepth 1 -type f -exec \
    install -Dm 644 -t "$pkgdir/usr/lib" '{}' +
  cp -dpr --no-preserve=ownership include "$pkgdir/usr"
}
