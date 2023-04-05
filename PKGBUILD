# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mdbook-d2
pkgver=0.2.2
pkgrel=1
pkgdesc='A preprocessor for mdbook to convert d2 codeblocks into SVG images'
arch=('x86_64')
url='https://github.com/danieleades/mdbook-d2'
license=('MIT')
depends=('glibc' 'gcc-libs' 'mdbook' 'd2')
makedepends=('rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr example "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
