# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sccs2rcs
pkgver=1.10
pkgrel=1
pkgdesc="Move an SCCS repository to RCS"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('xmlto')
depends=('sccs' 'python' 'rcs')
source=("https://gitlab.com/esr/rcs2sccs/-/archive/$pkgver/rcs2sccs-$pkgver.tar.gz" # yes really, the repository name got fat-fingered
        0001-remove-tab-char.patch)
sha512sums=('fdc9cedab40ef028555b3bdbcb0330fa368457458790d3e53e805507c74f00e0f15f8805987c38b00a5d71da980f3e374b1d5362a5ccb51ca433931c01f22b95'
            '9c1fed8bb82ad721048abbb069f6a41901e9499b1c064662975be515e545d619be677bb1a53624bf67d3b3613dbe5aa29d5c8d6a688bfccf2c4620df0294e9fd')

prepare() {
  cd "$srcdir/rcs2sccs-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/rcs2sccs-$pkgver"
  make $pkgname.1
}

package() {
  cd "$srcdir/rcs2sccs-$pkgver"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  install -m755 sccs2rcs "$pkgdir/usr/bin"
  install -m644 sccs2rcs.1 "$pkgdir/usr/share/man/man1"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
