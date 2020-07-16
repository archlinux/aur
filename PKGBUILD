# Maintainer: David Florness <david .[at]. florness .[dot]. com>

pkgname=monk
pkgver=0.2.0
pkgrel=1
pkgdesc="monk is a cli and daemon combo that manages articles that you want store and save for a later date."
arch=('i686' 'x86_64')
url="https://gitlab.com/fisherdarling/monk"
license=('GPL' 'Apache')
depends=()
makedepends=('rust')
_monolith_commit=bfdcd459e1b6e56befff818a29800ba1c8090b33
source=(https://gitlab.com/fisherdarling/monk/-/archive/monkd-v$pkgver/monk-monkd-v$pkgver.tar.gz
        https://github.com/Y2Z/monolith/archive/$_monolith_commit.tar.gz)
sha256sums=('f8f477c7462b45f15243e48c02aed2483c577f29ba021ee658d7d0bca42811bc'
            '923c8ea09a810b81b79ea35a01363707faef9c758cb9027bdd25e371f078bc50')

prepare() {
  cd "$srcdir"

  rm -rf $pkgname-monkd-v$pkgver/monolith
  mv monolith-$_monolith_commit $pkgname-monkd-v$pkgver/monolith
}

build() {
  cd "$srcdir/$pkgname-monkd-v$pkgver"

  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-monkd-v$pkgver"

  cargo test
}

package() {
  cd "$srcdir/$pkgname-monkd-v$pkgver"

  install -Dm755 target/release/monk $pkgdir/usr/bin/monk
  install -Dm755 target/release/monkd $pkgdir/usr/bin/monkd
}
