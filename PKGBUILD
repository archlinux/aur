# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher
pkgver=0.1.0
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/mcl"
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo')
provides=('mcl-launcher')
conflicts=('mcl-launcher-bin' 'mcl-launcher-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/mcl-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "$srcdir/mcl-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "$srcdir/mcl-${pkgver}"
  install -Dm755 "target/release/mcl" "$pkgdir/usr/bin/mcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
