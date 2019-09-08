# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sccs2rcs
pkgver=1.11
pkgrel=1
pkgdesc="Move an SCCS repository to RCS"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('xmlto')
depends=('sccs' 'python' 'rcs')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0170b4dc052a4d43767de941d0dee15e32c6f5d1689d402746bdd9655ed5de3a9ad2d2457cc5fb18edc5cfc891ea2804222a2556f0bf4704f845a8904f0e94bc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make $pkgname.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  install -m755 sccs2rcs "$pkgdir/usr/bin"
  install -m644 sccs2rcs.1 "$pkgdir/usr/share/man/man1"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
