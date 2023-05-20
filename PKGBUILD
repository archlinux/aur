# Maintainer: Andreas Backx

pkgname=waycorner
pkgver=0.2.1
pkgrel=2
pkgdesc="Hot corners for Wayland. Create anchors in the corners of your monitors and execute a command of your choice."
arch=('any')
url="https://github.com/AndreasBackx/waycorner"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ad1849085445019d98bc0347130ef8c0e25df00891a5c39c6fb2efbfb920a2fb')

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
