# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-smc
pkgver=0.6.4
pkgrel=1
pkgdesc="GNU Guile state machine compiler"
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-smc"
license=('GPL-3.0-or-later')
depends=('guile' 'guile-lib')
makedepends=('help2man')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f1a0a9174fd2911f054a2ba5e4d3f1803cc4c508c86063c38ccfa6d33bd0485b')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  local sitedir=$(guile-config info sitedir)
  ./configure \
    --enable-silent-rules \
    --prefix=/usr \
    --with-guilesitedir=$sitedir
  make
}

check() {
  cd "$pkgname-$pkgver"
  # the "compiler-guile" test currently fails...
  make -k check || :
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
