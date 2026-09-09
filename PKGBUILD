# Maintainer: Daniel Gustaw <gustaw.daniel@gmail.com>
pkgname=ranwhen
pkgver=0.2.1
pkgrel=1
pkgdesc="Visualize when your system was running (written in Rust, with macOS and Linux support)"
arch=('x86_64' 'aarch64')
url="https://github.com/gustawdaniel/ranwhen"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff09b46d0fcdd83a19eca2404d0c62f89203f81069a5955a552c22581690f895')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/ranwhen" "$pkgdir/usr/bin/ranwhen"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
