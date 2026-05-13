# Maintainer: objz <me@objz.dev>
pkgname=rmcl-git
pkgver=r116.ab9d9dd
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/rmcl"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'rust' 'cargo' 'jdk-openjdk')
provides=('rmcl')
conflicts=('rmcl' 'rmcl-bin' 'mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
replaces=('mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rmcl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/rmcl"
  cargo build --release --locked
}

check() {
  cd "$srcdir/rmcl"
  cargo test --release --locked
}

package() {
  cd "$srcdir/rmcl"
  install -Dm755 "target/release/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
