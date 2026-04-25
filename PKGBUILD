# Maintainer: objz <me@objz.dev>
pkgname=mcl-launcher
pkgver=0.2.2
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
sha256sums=('dc5b1e95323a2f1cbfbb37437f48d75d262e725a764da98fd6a7bcd9d1c782e6')

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
