# Maintainer: Maciej <macrionyn@proton.me>

pkgname=tinte
pkgver=2.0.1
pkgrel=1
pkgdesc="16-color palette generator for terminal and Wayland apps"
arch=('x86_64')
url="https://github.com/Maciejonos/tinte"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('tinte')
conflicts=('tinte')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b35219cc65720360a43ab5c1bfd2300ea210dde8069f23c70077a4f17ef48c2')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
