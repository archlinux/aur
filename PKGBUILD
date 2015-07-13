# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Scott Cassidy <scottlc@cpan.org>
# Contributor: Benjamin Robin <benjarobin>

pkgname=osmose
pkgver=0.9.96
pkgrel=4
pkgdesc="A Sega Master System / Gamegear console emulator"
arch=('i686' 'x86_64')
url="http://bcz.asterope.fr"
license=('GPL')
makedepends=('mesa')
depends=('qt4')
source=("http://bcz.asterope.fr/osmose/Osmose-${pkgver//./-}-QT.zip"
        'osmose.desktop' 'osmose.png' 'osmose.patch')

md5sums=('256b393d83270620e98f39e0cfb11359'
         '8189b6d17735eab45cace7723eb574f7'
         'ed9aed5b68cbe81bc69ede1893958750'
         '403cc66c15528d75615f4f2cf3438873')

build() {
    cd "$srcdir/Osmose-${pkgver//./-}-QT"
    patch -p1 < ../osmose.patch

    rm -Rf ../build
    mkdir ../build
    cd ../build

    qmake-qt4 ../Osmose-${pkgver//./-}-QT
    make
}

package() {
    cd "$pkgdir"

    install -D -m755 ${srcdir}/build/osmose usr/bin/osmose

    install -D -m644 ${srcdir}/osmose.desktop usr/share/applications/osmose.desktop
    install -D -m644 ${srcdir}/osmose.png usr/share/pixmaps/osmose.png
}
