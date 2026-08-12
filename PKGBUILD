# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=podfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI podcast downloader for RSS feeds and podcast discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Pommersche92/podfetch"
license=('GPL-2.0')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pommersche92/podfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('296b523c0ceec8d351f2d3292f760a36ed18374b9516b68d5379e36783a8bdfd')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
