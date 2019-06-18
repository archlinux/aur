# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.7
pkgrel=2
pkgdesc="Count source lines of code in a project."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('89f6f291e3177170f0b660a0495f9c623807817cfbed8b7731d2b6ba734df9a7ef4aae0a0ea971a00d131865ad05ee1fc9e45298f2d89fe7b09ffff9feeabea9')

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

  make loccount loccount.1
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
