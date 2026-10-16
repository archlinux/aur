# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ctl
pkgver=1.6.0
pkgrel=1
pkgdesc="CLI for COSMIC Desktop configuration management"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ctl"
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6f44c5a3d1bb1334a35231ddaf86ce8dd469c25eec0870a15b94a43014a6d9a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
