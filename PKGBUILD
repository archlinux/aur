# Maintainer: Andreas Backx

pkgname=waycorner
pkgver=0.1.3
pkgrel=2
pkgdesc="Hot corners for Wayland. Create anchors on specified locations of your monitors and execute a command of your choice."
arch=('any')
url="https://github.com/AndreasBackx/waycorner"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('54f6f93d6895712e09ff33b03c717f191a859bce92f44e7fe5810afd2b67c747')

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
