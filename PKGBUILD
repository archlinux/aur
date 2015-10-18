# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-sensors
pkgname=$_pkgname-git
pkgver=v5.6.0.alpha1.r14.g5efb5da
pkgrel=1
pkgdesc='Provides access to sensor hardware and motion gesture recognition'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qtsensors.git'
license=('GPL3' 'LGPL')
depends=('qt5-declarative-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtsensors.git#branch=dev")
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
