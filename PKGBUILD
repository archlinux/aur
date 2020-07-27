# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=ries
pkgver=20180812
pkgrel=1
pkgdesc="Find algebraic equations, given their solution"
arch=(i686 x86_64)
url="http://mrob.com/pub/ries/"
license=('GPL')

source=('http://mrob.com/pub/ries/src/ries.c.txt'
        'http://mrob.com/pub/ries/src/msal_math64.c.txt'
        'http://mrob.com/pub/ries/doc/ries.1.txt')

sha256sums=('73f77c1a91496056e5bf7629a848f002055554077793d323edf2c9f2c560152b'
            '98a219b116a15a5ad4768001996823a306d238f84405e75a1e228d81bfabaf2b'
            'b36684958adcad867e9be13c707d2f81280c3daf68ee3f0a5400f9ea040faf56')

build() {
  cd "$srcdir/"
 
  ln -sf ries.c{.txt,}
  ln -sf msal_math64.c{.txt,}

  gcc -DRIES_USE_SA_M64 -lm -march=native -Wall -O3 -o ries ries.c
}

package() {
  install -Dm 755 $srcdir/ries $pkgdir/usr/bin/ries
  install -Dm 644 $srcdir/ries.1.txt $pkgdir/usr/share/man/man1/ries.1
}

# vim:set ts=2 sw=2 et:
