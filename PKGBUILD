# Maintainer: Umar Alfarouk <medrivia@gmail.com>
# Contributor: jojii <jojii@gmx.net>

pkgname=jisho
_pkgname=jisho-cli
pkgver=0.1.4
pkgrel=2
pkgdesc="A very simple cli tool to lookup Japanese words using jisho.org"
arch=('x86_64' 'aarch64')
url="https://github.com/JojiiOfficial/$_pkgname"
license=('GPL-3.0-only')
depends=('libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dae869dd53ce2eb107a70379dc488579f350508ea6514850bcbb04db31c9020a')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
