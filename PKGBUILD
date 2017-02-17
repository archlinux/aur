# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.3.0
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('66192f58be8c1928731a8eabae87a05c2711d03a4a3af0cbecb4bb454d80ec1b4b9176d7a386c6cfeda68e0deafc33543c6914203dc40f1c33a5f87e57bf1712')

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
