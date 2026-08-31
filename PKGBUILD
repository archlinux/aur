# Maintainer: psdk <psdkjoon@gmail.com>
pkgname=psdk-arch
pkgver=2.2.3
pkgrel=1
pkgdesc="psdk's arch installer and configer"
arch=('x86_64')
url="https://github.com/psdkjoon/parch"
license=('MIT')
makedepends=('dart')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psdkjoon/parch/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/*-main
  dart pub get
  dart compile exe bin/parch.dart -o parch
}

package() {
  cd "$srcdir"/*-main
  install -Dm755 parch "$pkgdir/usr/bin/parch"
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
