# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=szyszka
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ce43243e103426e9b18e67aca6835ef8cf8882644bb231f88b0cdea622c3e984')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dvm 644 data/com.github.qarmin.szyszka.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dvm 644 "data/icons/com.github.qarmin.$pkgname.png" -t "$pkgdir/usr/share/icons/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
