# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.2.0
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
sha256sums=('b8b96f5459f2badc3a5fa0306a1d2d86f0ac71b8fb6f45c9e45e463224abee73')

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
