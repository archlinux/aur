# Maintainer: David Florness <david .[at]. florness .[dot]. com>

pkgname=monk
pkgver=0.3.0
pkgrel=1
pkgdesc="monk is a cli and daemon combo that manages articles that you want store and save for a later date."
arch=('i686' 'x86_64')
url="https://gitlab.com/fisherdarling/monk"
license=('GPL' 'Apache')
depends=()
makedepends=('rust')
_monolith_commit=96da64e1935b3d5046a90b61556894f0bc9276e4
source=(https://gitlab.com/fisherdarling/monk/-/archive/$pkgver/monk-$pkgver.tar.gz
        https://github.com/Y2Z/monolith/archive/$_monolith_commit.tar.gz)
sha256sums=('97f99fc783077161d443f0d19c8658f6658ce0730007f0c64adee9222140690b'
            '0a2a40bd452ffcd4775a2f7c1d112fcb28d4e765e3bb5e2b4a2f8d0c702aba49')

prepare() {
  rm -rf $pkgname-$pkgver/monolith
  mv monolith-$_monolith_commit $pkgname-$pkgver/monolith
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"

  cargo test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/monk $pkgdir/usr/bin/monk
  install -Dm755 target/release/monkd $pkgdir/usr/bin/monkd
}
