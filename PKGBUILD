# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-location
pkgname=$_pkgname-git
pkgver=v5.6.0.alpha1.r31.gf87ba04
pkgrel=1
pkgdesc='Provides access to position, satellite and area monitoring classes'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qtlocation.git'
license=('GPL3' 'LGPL')
depends=('qt5-declarative-git' 'geoclue')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtlocation.git#branch=dev")
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

    qmake "../$_pkgname"
    make
}

package() {
    cd "$srcdir/build"

    make INSTALL_ROOT="$pkgdir" install
    
    install -D -m644 $srcdir/$_pkgname/LGPL_EXCEPTION.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LGPL_EXCEPTION.txt
}
