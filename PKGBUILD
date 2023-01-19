# Maintainer: Ben Oliver <ben@bfoliver.com.com>

pkgname=stork
pkgver=1.6.0
pkgrel=2
pkgdesc="Impossibly fast web search, made for static sites."
arch=('x86_64')
url="https://github.com/jameslittle230/stork"
license=('Apache')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('5ce2c63569dd4f484930ab026324088f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked -- --skip pretty_print_search_results::tests::display_pretty_search_results_given_output
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
