# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.6
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a91f8277d0333615704bca4ff163cabd527d2a7a669aff3da72ec54059f9c882a94e2b41c9b2759e25eac752b27074c98bccc351d3f402126b723a3d4e229ef7')

prepare() {
	cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

  # binary
  install -vDm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # documentation
  install -vDm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 license -t "$pkgdir/usr/share/licenses/$pkgname"
}
