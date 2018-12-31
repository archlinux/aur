# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=url-bot-rs-git
pkgver=r162.6b904a0
pkgrel=1
pkgdesc='URL title fetching bot for IRC in Rust'
arch=('x86_64')
url=https://github.com/nuxeh/url-bot-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  cargo build --release --locked
}

check() {
  cd ${pkgname%-git}
  cargo test --release --locked
}

package() {
  cd ${pkgname%-git}
  install -Dt "$pkgdir"/usr/bin target/release/url-bot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
