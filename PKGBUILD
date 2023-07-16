# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage
pkgver=1.2.1
pkgrel=1
pkgdesc="Display images in your terminal"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
        #"$url/releases/download/v$pkgver/$pkgname-man-v$pkgver.tbz2")
sha512sums=('58244c9b07417659be6cf8024ac9f10b82971d7e9e025805b8adb953b20b93bee596d26851dc434221720f63ee27082125f0f282fb739e7227a93d6398e5af7f')

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
