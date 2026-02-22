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
sha256sums=('1dc30581ecb3e3438eadeeb7dd34bd7f400ba1b87f5f24f76b87740672579d20')

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