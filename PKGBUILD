# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.3
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2302dbc48345dfd3c01aeaad4b9f2e2a678f3b5261fb164a9e106301b30fb225e948c59f047ecb0ebce07f3fb534abd2a95f1a176357688149b5ef2b920bc8c6')

build() {
	cd "$pkgname-$pkgver"
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
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
