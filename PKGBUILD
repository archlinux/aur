pkgname=szsol-rs
pkgver=1.0.1
pkgrel=1
pkgdesc="A solitaire card game originating from SHENZHEN I/O, with tui/cli mode and solver"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/ghoker143/szsol-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff6340fa36165bd7b52325275d47994da9781c80a0d7d379ae8847ae88cfecaa')

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
