# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=rsspls
pkgver=0.11.2
pkgrel=1
pkgdesc="Generate RSS feeds from web pages"
arch=("x86_64")
url="https://github.com/wezm/rsspls"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5af6a54291258e271e948419bf72f621426469ed3852d6581d22fa8ce3eed05e')

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

