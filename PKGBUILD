# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=osgQt
pkgname=osgqt
pkgver=3.5.7
pkgrel=3
pkgdesc="Qt project for making use of OpenSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/openscenegraph/$_pkgname"
license=('LGPL3')
depends=('openscenegraph' 'qt5-base')
optdepends=()
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('8ecf4fb94720a02dacbdb1ceeda6f411')

build() {
    cd "$_pkgname-$pkgver"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_POSTFIX= .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    # provide libosgQt.so / openscenegraph-osgQt.pc
    cd $pkgdir/usr/lib
    ln -s libosgQt5.so libosgQt.so
    cd pkgconfig
    ln -s openscenegraph-osgQt5.pc openscenegraph-osgQt.pc
}
