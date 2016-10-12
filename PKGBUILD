# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=bearlibterminal-hg
pkgver=r346.ec58820886ab
pkgrel=1
pkgdesc='BearLibTerminal is a library that creates a terminal-like window facilitating flexible textual output and uncomplicated input processing.'
arch=('i686' 'x86_64')
url='http://foo.wyrd.name/en:bearlibterminal'
license=('MIT')
depends=('sfml-git')
makedepends=('mercurial' 'cmake')
provides=('bearlibterminal')
source=('bearlibterminal-hg::hg+https://bitbucket.org/cfyzium/bearlibterminal' '__init__.py')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$srcdir/$pkgname"

    cmake .
    make
}

package() {
    install -Dm644 __init__.py "$pkgdir/usr/lib/python3.5/site-packages/bearlibterminal/__init__.py"
    install -Dm644 __init__.py "$pkgdir/usr/lib/python2.7/site-packages/bearlibterminal/__init__.py"
    cd "$srcdir/$pkgname"
    SOLIB="Output/Linux64/libBearLibTerminal.so" 
    INCDIR="Terminal/Include"
    install -Dm644 "$SOLIB" "$pkgdir/usr/lib/libBearLibTerminal.so"
    install -Dm644 "$INCDIR/C/BearLibTerminal.h" "$pkgdir/usr/include/BearLibTerminal.h"
    install -Dm644 "$INCDIR/Python/PyBearLibTerminal.py" "$pkgdir/usr/lib/python3.5/site-packages/bearlibterminal/PyBearLibTerminal.py"
    install -Dm644 "$INCDIR/Python/PyBearLibTerminal.py" "$pkgdir/usr/lib/python2.7/site-packages/bearlibterminal/PyBearLibTerminal.py"
    install -Dm644 "$SOLIB" "$pkgdir/usr/lib/python3.5/site-packages/bearlibterminal/libBearLibTerminal.so"
    install -Dm644 "$SOLIB" "$pkgdir/usr/lib/python2.7/site-packages/bearlibterminal/libBearLibTerminal.so"
}
