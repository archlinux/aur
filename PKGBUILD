# Maintainer: Miko (mikoxyz) <mikoxyzzz@gmail.com>
pkgname=backdown-git
pkgver=r12.52507b8
pkgrel=1
pkgdesc="A deduplicator"
arch=('x86_64')
url="https://github.com/Canop/backdown"
license=('MIT')
depends=()
makedepends=('clang' 'git' 'rust')
options=('!lto')
source=("$pkgname::git+https://github.com/Canop/backdown.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
   cd "$pkgname"
   install -Dm755 target/release/backdown "${pkgdir}/usr/bin/backdown"
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
