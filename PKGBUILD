# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ctl
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI for COSMIC Desktop configuration management"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ctl"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26d9ea644fe55569dd03204d360258dde36388e7d324382804951377d12fc616')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
