# Maintainer: Antonio Cervone <ant dot cervone at gmail dot com>

pkgname=freesteam
pkgver=2.1
pkgrel=2
pkgdesc="Open source steam property routines in C"
arch=('i686' 'x86_64')
url="http://freesteam.sourceforge.net/"
license=('GPL')
depends=('gsl' 'gtk2' 'python')
makedepends=('scons')
source=(
    "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
    "python3.patch")
sha256sums=(
    '5993bb3aa8a121256e43363c7c2b66facc53142e0f5ed9e4f5daa492a1a3e976'
    'a0411f2987db9eb9ea052160041638e86aa0a4b53f541c472881001d8ab0877f')

prepare() {
    # fix line endings otherwise patch fails
    find ${pkgname}-${pkgver} -name \*.py -exec dos2unix {} \;
    patch -p0 < python3.patch
}

build() {
    cd ${pkgname}-${pkgver}
    scons INSTALL_PREFIX=/usr gtk
}

package() {
    cd ${pkgname}-${pkgver}
    scons INSTALL_PREFIX=/usr INSTALL_ROOT="$pkgdir" install
    install -D -m644 $srcdir/${pkgname}-${pkgver}/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
