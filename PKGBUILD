# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=ries
pkgver=20240422
pkgrel=1
pkgdesc="Find algebraic equations, given their solution"
arch=(i686 x86_64)
url="http://mrob.com/pub/ries/"
license=('GPL')

source=('http://mrob.com/pub/ries/src/ries.c.txt'
        'http://mrob.com/pub/ries/src/msal_math64.c.txt'
        'http://mrob.com/pub/ries/doc/ries.1.txt')

sha256sums=('5051931999b73285b0edb87c50e53315c44b783c87adb3594ed0c20d10bc4c1f'
            'dfcbe7a9605ab65c81ff802eb48a8ca5453097c24b7f8825c1f59b8894080ed4'
            '875b177a981652834f1fddfd651dff8a3f7e5b3013eef63f852ba97201a5b941')

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
