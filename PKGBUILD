# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=podfetch
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight CLI podcast downloader for RSS feeds and podcast discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/Pommersche92/podfetch"
license=('GPL-2.0')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pommersche92/podfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe3fb271093043af3dd482603b9772b5b34233d07f3737ce09a7ad0c14653c65')

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
