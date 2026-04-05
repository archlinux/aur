# Maintainer: Ashley <ashley at nullworks dot dev>
pkgname=drivemon
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI disk health and I/O monitor"
arch=('x86_64' 'aarch64')
url="https://github.com/zHappySnake/drivemon"
license=('MIT')
depends=('glibc' 'smartmontools')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9cfcff2f6c756d12c5f09db7b939d5af668bb936f5a5b598ad93e23d527a0e90')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
