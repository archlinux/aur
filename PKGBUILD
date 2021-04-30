# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-script
pkgname=$_pkgname-git
pkgver=v5.15.3.lts.r2.g5cec94b
pkgrel=1
pkgdesc='Classes for making Qt applications scriptable. Provided for Qt 4.x compatibility'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qtscript.git'
license=('GPL3' 'LGPL')
depends=("qt5-base")
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtscript.git#branch=5.15")
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

    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -D -m644 $srcdir/$_pkgname/LICENSE.* "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
