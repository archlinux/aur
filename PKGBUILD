# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.4.3
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('322ad4543c36e792224f69e0de28c8a5a8014f99b5821410203d3f6c9b04535d32708bc6aa1afed1b249052407914ae5c61bec584767546564d12508f1eea141')

prepare() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  mkdir -p build
  cd build || exit 1
  cmake .. -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  cd build || exit 1
  make
}

check() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  cd build || exit 1
  make test
}


package() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  cd build || exit 1
  make DESTDIR="$pkgdir" install
}
