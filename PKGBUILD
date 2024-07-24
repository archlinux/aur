# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.9.0
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('12957569c00ead259f8fb5b925624b4b681423a41b39275586de19e098b4197b')

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=' -ffat-lto-objects' cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

