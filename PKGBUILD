# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.0.1
pkgrel=1
pkgdesc="Ultralightweight JSON parse in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('76302c96f6529d62eaa0db23ba9b26ed73bee438732f814d9db1bd8eee5ca77b92fd15f95a25bd9312dc8ec92f68b51360fb25422593f63d5d25e4426bfbf9b5')

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
