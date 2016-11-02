# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
epoch=1
pkgver=0.6
pkgrel=1
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=(http://include-what-you-use.org/downloads/include-what-you-use-$pkgver.src.tar.gz)
sha1sums=('71295c39e7374a9c139154ac12b252fb5e1305f9')
arch=('i686' 'x86_64')
_lower=3.9
_upper=3.10
depends=('clang>='$_lower 'clang<='$_upper)
makedepends=('clang>='$_lower 'clang<='$_upper 'cmake' 'llvm>='$_lower 'llvm<='$_upper)
optdepends=('python2')

build() {
    cd $srcdir/$pkgname

    cmake -DIWYU_LLVM_ROOT_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
    sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" fix_includes.py
}

package() {
    cd $srcdir/$pkgname

    make install DESTDIR=$pkgdir
    install -Dm755 fix_includes.py "${pkgdir}/usr/bin/iwyu-fix_includes.py"
}

# vim:set ts=2 sw=2 et:
