# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=nudl
pkgver=1.3.0
pkgrel=1
pkgdesc="Unofficial downloader for Hyundai, Kia and Genesis (HMG) infotainment navigation firmware"
arch=('x86_64')
url="https://github.com/chenxiaolong/nudl"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'git')
options=('!lto')

source=("$pkgname-$pkgver.tar.gz::https://github.com/chenxiaolong/nudl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('956a109c0958db513148d738618f64e4d9c644839864a96ef5937da330c4f5a4')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --package nudl
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
