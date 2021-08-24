# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.7
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('b5328fa2a19f97b4d77eb42da6d9407318e8a5ff17cb1c6b34a5b4d3fb1bf3c673f5afec50579bb1b4acad15d58f2fe63bc08b1bd3d733100836c8bc684a020c')

prepare() {
	cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" license
}
