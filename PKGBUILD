# Maintainer: Itz-Agasta <rupamgolui69@gmail.com>
pkgname=metrocity
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal screensaver with animated pixel-art scenes that activate on idle"
arch=('x86_64' 'aarch64')
url="https://github.com/Itz-Agasta/metrocity"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40c733d18ee9182d2a976a5c60bfab36e36b4f4071b406886310200a9eae4d40')

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
