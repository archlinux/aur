# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=fd-rs
pkgver=4.0.0
pkgrel=1
pkgdesc='Simple, fast and user-friendly alternative to find'
arch=('i686' 'x86_64')
url=https://github.com/sharkdp/fd
license=('MIT')
makedepends=('rust')
source=("fd-rs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('56b10a55ad06ef4fdf68ad97b263551ecd2d3b47c0a8bd2d7ce70dce4033e7bc628a965f77bd3b6b9a3ec41e422d6e9c0754c1aeadcf5003dc1ebb6fba5fdbd0')

build() {
  cd fd-$pkgver
  cargo build --release
}

check() {
  cd fd-$pkgver
  cargo test --release
}

package() {
  cd fd-$pkgver
  install -Dm755 target/release/fd "$pkgdir"/usr/bin/fd
  install -Dm644 target/release/build/fd-find-*/out/fd.bash-completion "$pkgdir"/usr/share/bash-completion/completions/fd.bash-completion
  install -Dm644 target/release/build/fd-find-*/out/fd.fish "$pkgdir"/usr/share/fish/vendor_completions.d/fd.fish
  install -Dm644 target/release/build/fd-find-*/out/_fd "$pkgdir"/usr/share/zsh/site-functions/_fd
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/fd-rs/LICENSE
}

# vim:set ts=2 sw=2 et:
