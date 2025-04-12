# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ctl
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI for COSMIC Desktop configuration management"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ctl"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e5dff3a91f1bfbec650854ea8f63c5a88ec028c8236e23faa90286510a0109e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
