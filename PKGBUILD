# Maintainer: David Florness <david .[at]. florness .[dot]. com>

pkgname=monk
pkgver=0.3.0
pkgrel=3
pkgdesc="monk is a cli and daemon combo that manages articles that you want store and save for a later date."
arch=('i686' 'x86_64')
url="https://gitlab.com/fisherdarling/monk"
license=('GPL' 'Apache')
depends=()
makedepends=('rust')
_monolith_commit=96da64e1935b3d5046a90b61556894f0bc9276e4
source=(https://gitlab.com/fisherdarling/monk/-/archive/monk-v$pkgver/monk-monk-v$pkgver.tar.gz
        https://github.com/Y2Z/monolith/archive/$_monolith_commit.tar.gz)
sha256sums=('80d4f4817b7b7a94433cad8f49729ff76058cbe67447fa6fbc2a5dbc8a0eb6c0'
            '0a2a40bd452ffcd4775a2f7c1d112fcb28d4e765e3bb5e2b4a2f8d0c702aba49')

prepare() {
  rm -rf $pkgname-monk-v$pkgver/monolith
  mv monolith-$_monolith_commit $pkgname-monk-v$pkgver/monolith
}

build() {
  cd "$pkgname-monk-v$pkgver"

  cargo build --release
}

check() {
  cd "$pkgname-monk-v$pkgver"

  cargo test
}

package() {
  cd "$pkgname-monk-v$pkgver"

  install -Dm755 target/release/monk $pkgdir/usr/bin/monk
  install -Dm755 target/release/monkd $pkgdir/usr/bin/monkd
}
