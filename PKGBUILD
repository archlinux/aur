# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=ries
pkgver=20140304
pkgrel=1
pkgdesc="Find algebraic equations, given their solution"
arch=(i686 x86_64)
url="http://mrob.com/pub/ries/"
license=('GPL')

source=('http://mrob.com/pub/ries/src/ries.c.txt'
        'http://mrob.com/pub/ries/src/msal_math64.c.txt'
        'http://mrob.com/pub/ries/doc/ries.1.txt')

md5sums=('5c7d81bad30d6479ac703cc98f1221cd'
         'cd812204920dc9baf40f348795232128'
         '9930186203591c6f593e3cd9608430c8')

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
