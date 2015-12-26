# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-imageformats
pkgname=$_pkgname-git
pkgver=v5.6.0.alpha1.r10.g8f7d6e7
pkgrel=1
pkgdesc='Plugins for additional image formats: TIFF, MNG, TGA, WBMP'
arch=('i686' 'x86_64')
url='http://code.qt.io/cgit/qt/qtimageformats.git'
license=('GPL3' 'LGPL')
depends=('qt5-base-git' 'libtiff' 'jasper' 'libmng' 'libwebp')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtimageformats.git#branch=dev")
sha256sums=("SKIP")

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

