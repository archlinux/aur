# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher-git
pkgver=r116.ab9d9dd
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/mcl"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('mcl-launcher')
conflicts=('mcl-launcher' 'mcl-launcher-bin')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mcl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/mcl"
  cargo build --release --locked
}

check() {
  cd "$srcdir/mcl"
  cargo test --release --locked
}

package() {
  cd "$srcdir/mcl"
  install -Dm755 "target/release/mcl" "$pkgdir/usr/bin/mcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
