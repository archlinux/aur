# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=shmooz
pkgver=0.1.0
pkgrel=2
pkgdesc="A zoom / magnifier utility for Wayland compositors"
arch=('x86_64')
url="https://github.com/chmouel/shmooz"
license=('Apache-2.0')
depends=('wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chmouel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('770196d66374057a474306e948f6c1d0da889391b290bc5fa627e2a18f805a8e')

prepare() {
  cd "$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
