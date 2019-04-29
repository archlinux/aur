# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Hong-Yi Dai <reflectionalist_at_gmail_dot_com>

pkgname=picosat
pkgver=965
pkgrel=2
pkgdesc="The PicoSAT solver"
arch=('i686' 'x86_64')
url="http://fmv.jku.at/picosat/"
license=('MIT')
source=("http://fmv.jku.at/picosat/${pkgname}-${pkgver}.tar.gz")
md5sums=('d37c236d5c60b03d888d137c2fa4285f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure.sh --static --shared
  ./mkconfig.sh
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 picosat "$pkgdir/usr/bin/picosat"
  install -Dm755 picomus "$pkgdir/usr/bin/picomus"
  install -Dm755 picomus "$pkgdir/usr/bin/picogcnf"
  install -Dm755 picomus "$pkgdir/usr/bin/picomcs"

  install -Dm755 libpicosat.so "$pkgdir/usr/lib/libpicosat.so"
  install -Dm644 libpicosat.a  "$pkgdir/usr/lib/libpicosat.a"
  install -Dm644 picosat.h     "$pkgdir/usr/include/picosat.h"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

