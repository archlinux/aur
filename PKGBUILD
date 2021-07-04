# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfcat
pkgver=0.1.4
pkgrel=1
pkgdesc="Generates HTML files from ELF binaries"
arch=('x86_64')
url="https://github.com/ruslashev/elfcat"
license=('ZLIB')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('640ba104e2942fdcea7157cb6bc771fe6c95f69bc72c017770ff2e7e8003afc651bc99bf3dec4ebd25f2499723d0d9e03c6031af47068bfc73f21e9be8dae310')

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
