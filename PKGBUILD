# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher
pkgver=0.2.3
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/mcl"
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo' 'jdk-openjdk')
provides=('mcl-launcher')
conflicts=('mcl-launcher-bin' 'mcl-launcher-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5439052795c56da11e694b0cff3edba161f24f04af25670dc485b8761428bba0')

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
