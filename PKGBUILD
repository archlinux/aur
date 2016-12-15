# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.1.0
pkgrel=1
pkgdesc="Ultralightweight JSON parse in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('febadc2f22e97ff86bc75a0bf82598abf3d885b5bc753e09e2aaa29fc7636a37354572a539d6a00c87f9bd6b3568ea242b264a7580171cd89d0b47cc0a2d2f32')

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
