# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=shmooz
pkgver=0.2.0
pkgrel=2
pkgdesc="A zoom / magnifier utility for Wayland compositors"
arch=('x86_64')
url="https://github.com/chmouel/shmooz"
license=('Apache-2.0')
depends=('wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chmouel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('02a073a5d4d3882018cae5a96bb8e3ad077201add7c6dc8fd5f9929b15cd0522')

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
