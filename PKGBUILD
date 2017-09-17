# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.3.0
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
sha256sums=('e9e00d6e3ffc048b54a0eedef0f6f4c741d685be746327ed23925f21dbc3b39a')

prepare() {
    cd "$srcdir/huggle3-qt-lx-${pkgver}/huggle"

    pushd libs
    for f in *.zip; do
        unzip -u "$f"
    done
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
