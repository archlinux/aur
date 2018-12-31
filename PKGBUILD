# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=fcat-git
pkgver=r40.c938b62
pkgrel=1
pkgdesc="cat implementation in Rust using Linux' splice syscall"
arch=('x86_64')
url=https://github.com/mre/fcat
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('fcat')
conflicts=('fcat')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd fcat
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fcat
  cargo build --release --locked
}

check() {
  cd fcat
  cargo test --release --locked
}

package() {
  cd fcat
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/fcat-git/LICENSE
  install -Dt "$pkgdir"/usr/bin target/release/fcat
}

# vim:set ts=2 sw=2 et:
