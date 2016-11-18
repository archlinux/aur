# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.0.0
pkgrel=1
pkgdesc="Ultralightweight JSON parse in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('66a20c62dd9325b669dd5c58d3403ceffc83905c80dc61233b9e199bed9f8d44a81894166f7e2ac7582c4d81c13a3947fce52617b16ca607524619feee62d973')

prepare() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  mkdir -p build
  cd build || exit 1
  cmake .. -DENABLE_CJSON_UTILS=On -DENABLE_CJSON_TEST=Off -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  cd build || exit 1
  make
}


package() {
  cd "$srcdir/cJSON-$pkgver" || exit 1
  cd build || exit 1
  make DESTDIR="$pkgdir" install
}
