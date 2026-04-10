# Maintainer: UMCEKO <umutcevdetkocak@gmail.com>
pkgname=ddctui
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI for controlling monitor settings via DDC/CI (ddcutil)"
arch=('x86_64')
url="https://github.com/UMCEKO/ddctui"
license=('MIT')
depends=('ddcutil')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/UMCEKO/ddctui/archive/v$pkgver.tar.gz")
sha256sums=('201a16d5512d763907a54d3769e3479a93a4ad07b2fa10504613fd29c9de8187')

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
