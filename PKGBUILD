# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.4.4
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('847946571ceae474606f4e870f9d6016e6ca2a0afb5b2c2ff1dabc6501cc5664bed3d199e4ae3114e79bfb202bdbb165dd8f2ca894bf6d4b7c7abedbdbe5c098')

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
