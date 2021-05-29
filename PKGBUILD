# Maintainer: Andreas Backx

pkgname=waycorner
pkgver=0.1.0
pkgrel=2
pkgdesc="Hot corners for Wayland. Waycorner allows you to create anchors on specified locations of your monitors and execute a command of your choice."
arch=('any')
url="https://github.com/AndreasBackx/waycorner"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('329b70cef12e476409bd542842bb77637f6ee31cb49553e6d1319efa0c17d65e')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  OUT_DIR="$(cargo build --release --locked)"

  install -Dm755 "target/release/waycorner" "$pkgdir/usr/bin/waycorner"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
