# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-debubble
pkgver=1.1
pkgrel=3
pkgdesc="Clean up merge bubbles in a Git repository"
arch=('any')
depends=('git')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz"
        0001-Makefile-Sanitize-the-install-and-uninstall-targets.patch
        0002-Correct-the-order-of-git-am-arguments.patch)
sha256sums=('6b2cd99cea708a06b96068eedaa402ce61a50870cd734e446055312da031b6ef'
            '2f9440937cb6fa2b4a2b19c2b2964dfe3569bd05560023ff02d5e678890b025f'
            '528aa930db8bf9864a2c320a5cd9a8ac212128652946fa2cea90916b0ac1b8d7')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
