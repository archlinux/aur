# Maintainer: Dest1n1 <dest1nis2022@gmail.com>

pkgname=swisys
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple tool to switch system on reboot."
arch=('x86_64')
url="https://github.com/dest1n1s/swisys"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dest1n1s/swisys/archive/v$pkgver.tar.gz")
sha256sums=('4db3228594a35dcb31821c8ab6b1d25f10f7497db388d8b11a9249224e860918')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 