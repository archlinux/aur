# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.4.2
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('48e81c3bcafa9273a531c7fe83e29a1cb48a3b4450cb5961d96b3135a32745e42088b39b8795520559ddcf64e3e090862ce22a866d9590ae202dc5027ec5b69b')

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
