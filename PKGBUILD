# Maintainer: Mathieu Fenniak <mathieu@fenniak.net>
pkgname=csv-to-clipboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Copy CSV files onto the clipboard in a pasteable format"
arch=('x86_64')
url="https://github.com/mfenniak/csv-to-clipboard"
license=('MIT')
depends=('libxcb' 'libxdmcp' 'libxau')
makedepends=(
  'cargo'
  'python' # build-time dep of rust library xcb
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mfenniak/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('4ddbb00782c56f1cd7095609cc1c8137bbac799db7ce8dec4332d8bf212ca5d62b36348b6809f3f98e053fc4ab309ab6df06a20aac47ff2141186a2951da0dd8')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked 
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/csv-to-clipboard" "$pkgdir/usr/bin/csv-to-clipboard"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
