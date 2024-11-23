# Maintainer: Lorenzo Cappelletti <lorenzo_dot_cappelletti_at_gmail_dot_com>
# Previous Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Hong-Yi Dai <reflectionalist_at_gmail_dot_com>

pkgname=picosat
pkgver=965
pkgrel=4
pkgdesc="The PicoSAT solver"
arch=('x86_64')
options=('!lto')
url="http://fmv.jku.at/picosat/"
license=('MIT')
source=("http://fmv.jku.at/picosat/${pkgname}-${pkgver}.tar.gz"
        configure.patch)
sha256sums=('15169b4f28ba8f628f353f6f75a100845cdef4a2244f101a02b6e5a26e46a754'
            '33962674158610349f9b2539db51b31e65f9f012809a52d3c2cc97665a1e8dd0')

prepare() {
  cd "$pkgname-$pkgver"
  patch configure.sh <"$srcdir/configure.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure.sh --static --shared
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 picosat "$pkgdir/usr/bin/picosat"
  install -Dm755 picomus "$pkgdir/usr/bin/picomus"
  install -Dm755 picomus "$pkgdir/usr/bin/picogcnf"
  install -Dm755 picomus "$pkgdir/usr/bin/picomcs"

  install -Dm755 libpicosat.so "$pkgdir/usr/lib/libpicosat.so"
  install -Dm644 libpicosat.a  "$pkgdir/usr/lib/libpicosat.a"
  install -Dm644 picosat.h     "$pkgdir/usr/include/picosat.h"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

