# Maintainer: Mathieu Fenniak <mathieu@fenniak.net>
pkgname=csv-to-clipboard
pkgver=1.0.3
pkgrel=1
pkgdesc="Copy CSV files onto the clipboard in a pasteable format"
arch=('x86_64')
url="https://github.com/mfenniak/csv-to-clipboard"
license=('MIT')
depends=('gtk3')
makedepends=(
  'cargo'
  'python' # build-time dep of rust library xcb
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mfenniak/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('cf39ceb20fd0e73a33f4ddc8baee16cc06b24695a3c3dfa2777e2e6b9c79c197e0e282087eecfe669ca58bb1ea185545e023ff6ad3c2b8d7721d1c77f83ad7c7')

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
