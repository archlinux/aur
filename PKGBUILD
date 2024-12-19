# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ctl
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for COSMIC Desktop configuration management"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ctl"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43be70adcbdac6778095abf668983be9c0ce385ba586b45fd84a8f57f7b36462')

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
