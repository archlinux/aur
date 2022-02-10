# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage
pkgver=1.2.0
pkgrel=1
pkgdesc="Display images in your terminal"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
        #"$url/releases/download/v$pkgver/$pkgname-man-v$pkgver.tbz2")
sha512sums=('10fe74c2097379113e2ad8777793a7f49d7707acac650f7b7e0505d7d61a15b524019325fabc4eaa149aa0130979ee2c49ca2549f04d99dfeb925b0f68d6fac3')

prepare() {
  cd "$pkgname-$pkgver"
  # TODO: Use `--locked` flag for reproducibility.
  # Tracking issue: https://github.com/nabijaczleweli/termimage/pull/16#issuecomment-729920052
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  #install -Dm 644 "../$pkgname-man-v$pkgver/$pkgname.md" -t "$pkgdir/usr/share/doc/$pkgname"
  #install -Dm 644 "../$pkgname-man-v$pkgver/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
