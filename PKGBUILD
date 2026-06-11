# Maintainer: objz <me@objz.dev>
pkgname=rmcl
pkgver=0.3.1
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/rmcl"
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo' 'jdk-openjdk')
provides=('rmcl')
conflicts=('rmcl-bin' 'rmcl-git' 'mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
replaces=('mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('28ba28c0aa9a83dc897fd4478308b4a3700e13d522e0e9a5d186ae1efa72b8b2')

build() {
  cd "$srcdir/rmcl-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "$srcdir/rmcl-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "$srcdir/rmcl-${pkgver}"
  install -Dm755 "target/release/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
