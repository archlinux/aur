# Maintainer: Andreas Backx

pkgname=waycorner
pkgver=0.2.2
pkgrel=2
pkgdesc="Hot corners for Wayland. Create anchors in the corners of your monitors and execute a command of your choice."
arch=('any')
url="https://github.com/AndreasBackx/waycorner"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('39282b798713aa2a4d3f598d28fea627d7767bea26573f0b3099c8b5b5dfceb8')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"

  OUT_DIR="$(cargo build --release --locked)"

  install -Dm755 "target/release/waycorner" "$pkgdir/usr/bin/waycorner"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
