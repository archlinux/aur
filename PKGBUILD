pkgname=szsol-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple solitaire card game originating from SHENZHEN I/O"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://github.com/ghoker143/szsol-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb59b12d2e60192ddf696a3287460073f2f3b260051ac2348e3e1e7c265efe1f')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/szsol" "$pkgdir/usr/bin/$pkgname"
}
