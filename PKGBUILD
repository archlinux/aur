# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.8
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('96ccaf0b17afade1c0066dcf0af18869e8515de429fb1a9561e8a5b7844da3cf914006334dcc66a99ab7a0261c55cd73f907a6e04aa07c2ec33d8b8750d89d74')

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
