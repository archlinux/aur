# Maintainer: Daniel Gustaw <gustaw.daniel@gmail.com>
pkgname=runwhen
pkgver=0.2.0
pkgrel=1
pkgdesc="Visualize when your system was running (written in Rust, with macOS and Linux support)"
arch=('x86_64' 'aarch64')
url="https://github.com/gustawdaniel/ranwhen"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
provides=('ranwhen')
conflicts=('ranwhen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ca51a3e9c5538178a451d80f1886cbe3a9a753e1a3feef940c1aa4e9feb1312')

build() {
  cd "ranwhen-$pkgver"
  cargo build --release --locked
}

check() {
  cd "ranwhen-$pkgver"
  cargo test --release --locked
}

package() {
  cd "ranwhen-$pkgver"
  install -Dm755 "target/release/ranwhen" "$pkgdir/usr/bin/ranwhen"
  ln -s /usr/bin/ranwhen "$pkgdir/usr/bin/runwhen"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
