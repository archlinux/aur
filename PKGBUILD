# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
_gitver=019045a6887e5e0a81624a6ea31997bfee605475
pkgver=3.1.20.g${_gitver:0:7}
pkgrel=2
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${_gitver}.tar.gz")
sha256sums=('6f8a4fc53f188fb5751839c25495f24722fcf92453c610dbd8f81166dc563630')

prepare() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"

    pushd libs
    unzip libirc.zip
}

build() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=true

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"
    make DESTDIR=$pkgdir install
}
