#Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=erlang-gproc
_pkgname=${pkgname/erlang-//}
pkgver=0.5
pkgrel=1
pkgdesc="Extended process registry for Erlang"
arch=('i686' 'x86_64')
url=https://github.com/uwiger/gproc/
license=('MIT')
depends=('erlang-nox')
makedepends=('rebar')
source=("https://github.com/uwiger/gproc/archive/$pkgver.tar.gz")
md5sums=('9bf4d95c09197efd82ffeb9b00b04356')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}
    
check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/$pkgname
  for i in ebin src priv include; do
    cp -R $i "$pkgdir"/usr/lib/erlang/lib/$pkgname
  done
  install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

