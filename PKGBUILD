pkgname=szsol-rs
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple solitaire card game originating from SHENZHEN I/O"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://github.com/ghoker143/szsol-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f511ba524925ce73579b86a476bc9960e2ee73f9a2499000373cee8233c9022')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
