# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.5
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('69239f1db94c5d59644e8e51ba34c67ea14435ca2773b411d664a2ee085c1e257d37b2bbbb7c9078fb59ec4d8222e430485bbf110f771922ad8524f0e5c88a41')

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
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
