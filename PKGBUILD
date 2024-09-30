# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sccs2rcs
pkgver=1.14
pkgrel=1
pkgdesc="Move an SCCS repository to RCS"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoctor')
depends=('sccs' 'python' 'rcs')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0eb059ea27e2a14a1f90116d5382f77df69be8df8c8a663ec77397505ac2b75270e391dcb16e554e8181e957caa4679644a464b110706b71e8bb6b75d8049606')

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
