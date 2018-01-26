# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.3.3
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-multimedia' 'qt5-webengine')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
sha256sums=('7df6150503b8f5f54d511e38737a0533c88c44554eb333a9c4abf2a964deb093')

prepare() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"

    pushd libs
    for f in *.zip; do
        unzip -u "$f"
    done
}

build() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=true -DWEB_ENGINE=true

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"
    make DESTDIR=$pkgdir install
}
