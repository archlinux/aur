# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.10.0
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8ac3ac58d04a1d49372cb480f07e6646991f9e5b5a7f748ac5bbfe973104b958')

build() {
  cd "$pkgname-$pkgver"
  # https://archlinux.org/todo/lto-fat-objects/
  CFLAGS+=' -ffat-lto-objects' cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

