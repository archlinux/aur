# Maintainer: itsme <mymail@ishere.ru>

pkgname=vacuum-im
pkgver=1.2.5
pkgrel=3
pkgdesc='Crossplatform Jabber/XMPP client'
arch=('i686' 'x86_64')
url="http://www.vacuum-im.org/"
license=('GPL3')
depends=('qt4' 'openssl' 'libidn' 'libxss' 'minizip')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vacuum-IM/$pkgname/archive/$pkgver.tar.gz"
        "messagearchiver_build_fix.patch")
md5sums=('2004a882c95207b3244aadf77e822b9a'
         '5815ef9480dd6ad94b78907d79642b5f')
sha256sums=('3237933f68884fb5b3422ad0fc97083b40a7aae9d8c105a23720c09599ffe5da'
            '294e6639913e1d7495fb4729045683a3d61a20395d2de2de4204434c9a5050e7')

prepare() {
    cd $pkgname-$pkgver
    patch -p0 --binary < ../messagearchiver_build_fix.patch
}

build() {
    cd $pkgname-$pkgver
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir/" install
}
