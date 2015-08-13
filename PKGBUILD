# Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
pkgname=qelectrotech
pkgver=0.4
pkgrel=1
pkgdesc=''
arch=('i686' 'x86_64')
url='http://qelectrotech.org/'
license=('GPL')
provides=('qelectrotech')
depends=('qt4')
makedepends=('tar')
source=('http://download.tuxfamily.org/qet/tags/20150220/qelectrotech-0.4-src.tar.gz')
sha1sums=('SKIP')
install=qelectrotech.install

build() {
    cd "$srcdir/$pkgname-$pkgver-src"
    sed -i -e "s_/usr/local_$pkgdir/usr_g" qelectrotech.pro
    qmake-qt4 DEFINES+=QET_COMMON_COLLECTION_PATH=/usr/share/qelectrotech/elements -o Makefile qelectrotech.pro
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src"
    make install
    mv $pkgdir/share $pkgdir/usr/share
    mv $pkgdir/usr/man $pkgdir/usr/share
    mv $pkgdir/usr/doc $pkgdir/usr/share
}

# vim:ts=4:sw=4:expandtab
