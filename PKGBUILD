# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tracker
pkgver=0.1.4
pkgrel=1
pkgdesc="A terminal-based real-time satellite tracking and orbit prediction application"
arch=('x86_64')
url="https://github.com/ShenMian/tracker"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c5d298043ed37e1a82d70c3c893b2039e2ab47c96fd1c31f44526ee8da418482af4068422c40d2b36ad9a277a6f4cfe7552ec518c8608565f19579fbfa3e0435')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
