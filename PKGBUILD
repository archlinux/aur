# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=szyszka
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2292aee4d2e5a3b2631913fb1885cc410545018b502a18f77d01bb5b62e81a14')

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
  install -Dm 755 "target/release/szyszka" -t "$pkgdir/usr/bin/"
  install -Dm 644 data/com.github.qarmin.szyszka.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm 644 data/icons/com.github.qarmin.szyszka.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
