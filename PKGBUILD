pkgname=szsol-rs
pkgver=0.7.1
pkgrel=1
pkgdesc="A solitaire card game originating from SHENZHEN I/O, with tui/cli mode and solver"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/ghoker143/szsol-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('099a10a242ac18a5bd447e6ff01170f15f9e6e2ffe639d04b257616777d050aa')

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
