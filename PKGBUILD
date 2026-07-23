# Maintainer: Itz-Agasta <rupamgolui69@gmail.com>
pkgname=metrocity
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal screensaver with animated pixel-art scenes that activate on idle"
arch=('x86_64' 'aarch64')
url="https://github.com/Itz-Agasta/metrocity"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36b5195a251f96da8ff4a2d01f5678ce144b46c876dbd05dcfa5f05cb0cfe552')

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
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
