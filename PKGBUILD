# Maintainer: Max Bruckner
pkgname=cjson
pkgver=1.4.0
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('107c157131bb441dbd0b95b79029c77fea80cd3782614fac16aa78e084a8555967fb6081eacbf10de568275dd605addc6d5c3f2aea5f653a51cda585ca7ce562')

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
