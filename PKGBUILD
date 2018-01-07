# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=ries
pkgver=20170212
pkgrel=1
pkgdesc="Find algebraic equations, given their solution"
arch=(i686 x86_64)
url="http://mrob.com/pub/ries/"
license=('GPL')

source=('http://mrob.com/pub/ries/src/ries.c.txt'
        'http://mrob.com/pub/ries/src/msal_math64.c.txt'
        'http://mrob.com/pub/ries/doc/ries.1.txt')

sha256sums=('be94e308eedb8cb3ae3fb0095e2ca135e696b56983f7c9d2db07711a93e1c4ea'
            '98a219b116a15a5ad4768001996823a306d238f84405e75a1e228d81bfabaf2b'
            '5c4c962a0b457ce167cd7b1ce5d26e8e04b258a027b198eaf9f185e2ce91cb21')

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
