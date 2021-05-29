# Maintainer: Andreas Backx

pkgname=waycorner
pkgver=0.1.1
pkgrel=2
pkgdesc="Hot corners for Wayland. Create anchors on specified locations of your monitors and execute a command of your choice."
arch=('any')
url="https://github.com/AndreasBackx/waycorner"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4dda9580d6a0624eed3c01de147aff589696dd9459846d1d196cbe926ede23b1')

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
