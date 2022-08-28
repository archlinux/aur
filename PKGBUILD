# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2b870159b1c2d0a4d69e8a8136a7cce5d395c6b39040a3a7fbc15dab36597623')

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

