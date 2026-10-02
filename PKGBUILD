# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=podfetch
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight CLI podcast downloader for RSS feeds and podcast discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Pommersche92/podfetch"
license=('GPL-2.0')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pommersche92/podfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('744726d0b7c158db41950a7bff33f31a18e33527a27f8cef40f8ba1e98f9552d')

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
