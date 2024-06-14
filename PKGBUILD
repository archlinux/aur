# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.1.0_alpha
pkgrel=5
url="https://github.com/eugene-babichenko/fixit"
pkgdesc="A utility to fix mistakes in your commands."
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz")
sha256sums=("015e87eea277ac069065792b7ebebf5056d5b96c7b3bd95aff1a51f3d761647a")

build() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
