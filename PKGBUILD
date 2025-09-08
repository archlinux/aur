# Maintainer: Bishnu Babu Sah <your.email@example.com>

pkgname=dns-changer
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust-based tool for changing DNS interactively"
arch=('x86_64')
url="https://github.com/bishnu7babu/dns_changer"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/dns_changer-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/dns_changer-$pkgver"
  # Install binary (crate builds dns_changer, we rename it to dns-changer in PATH)
  install -Dm755 "target/release/dns_changer" "$pkgdir/usr/bin/dns-changer"
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
