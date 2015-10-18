# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-x11extras
pkgname=$_pkgname-git
pkgver=v5.5.0.r2.g85654ad
pkgrel=1
pkgdesc='Provides platform-specific APIs for X11'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qtx11extras.git'
license=('GPL3' 'LGPL')
depends=('qt5-base-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtx11extras.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir/build"

    qmake "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/build"

    make INSTALL_ROOT="$pkgdir" install

    install -D -m644 $srcdir/$_pkgname/LGPL_EXCEPTION.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LGPL_EXCEPTION.txt
}
