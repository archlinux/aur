# Maintainer: Sergey Ovanesyan <sergey@ovanesyan.com>
pkgname=calendarchy
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6128e47c12ea0658a8d8a0c5f55faec4db5e5619ecd6fa13f8d0946d8f460d38')

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
