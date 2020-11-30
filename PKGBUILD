# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs
_pkgname=dotter
pkgver=0.10.3
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname")
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('02bde4d8c2447dd3437152e45660a66b60c8b76c7e7c8334f5b271824c0b4b6f962965cf4ea90b136568cce82893a5a342789e3492bd4d26570cfbb80d1296ad')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
