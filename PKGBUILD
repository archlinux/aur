# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-make
pkgver=0.35.2
pkgrel=1
pkgdesc="Rust task runner and build tool"
arch=('x86_64')
url="https://github.com/sagiegurari/cargo-make"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d20b0df6bdb8e21bcd808ba3465b9781f24dd04c1532675d8069c492ad5e54697641d461a9e88f34efc985ac38479a947735bd2f38028c7c1ea9606820f4e4fd')
b2sums=('d0c4084c03cceea0bc0e9a198b7415b70fe0ce6a0c0f5221297a10193c328f54ee879e9bfd752d8ce8732d872806f4b04b1716838ea5d9a8ce1b9d44e57345dd')

prepare() {
  # download dependencies
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
