# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('400d265fe44d4efe475cc1144d93bf39e26f690d3d349669734b6146350f6ecd')

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

