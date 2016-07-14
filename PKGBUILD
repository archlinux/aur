# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.1.21
pkgrel=2
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
sha256sums=('7c7f78d794e82a982368816d043450e85c70369db992689f0778457eaebfef8a')

prepare() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"

    pushd libs
    unzip libirc.zip
}

build() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=true

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"
    make DESTDIR=$pkgdir install
}
