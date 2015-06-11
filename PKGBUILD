# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=fuego
pkgver=1.1
pkgrel=4
pkgdesc="A collection of C++ libraries for the game of Go"
arch=('i686' 'x86_64')
url="http://fuego.sourceforge.net/"
license=('GPL')
depends=('boost-libs')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "gcc46.patch"
        "boost_fix.patch")
md5sums=('9c53cad89efd2a7943e31b667002d258'
         '788114d7d1ba774c462d5ec83129d1bb'
         '14bc9b2a789a52fb2a3a64f3cff0f769')

build()
{
    cd $srcdir/$pkgname-$pkgver
    patch -Np1 -i $srcdir/gcc46.patch
    patch -Np1 -i $srcdir/boost_fix.patch
    CXXFLAGS="-march=native -O3 -pipe -DBOOST_FILESYSTEM_VERSION=3" \
        LIBS="-lpthread" ./configure --prefix=/usr
    make
}

package()
{
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
