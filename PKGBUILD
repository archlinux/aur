# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.8.1
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1720447ff0e652e4719d7f4a2d3337a52c59f326e54a50dda7529ed7a6930ce0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

