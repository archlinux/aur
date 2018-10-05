# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=url-bot-rs-git
pkgver=r87.c06eb21
pkgrel=1
pkgdesc='URL title fetching bot for IRC in Rust'
arch=('x86_64')
url=https://github.com/nuxeh/url-bot-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('rust')
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
  cargo build --release
}

check() {
  cd ${pkgname%-git}
  cargo test --release
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 target/release/url-bot "$pkgdir"/usr/bin/url-bot
}

# vim:set ts=2 sw=2 et:
