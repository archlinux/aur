# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=hodoku-build
pkgver=2.2.0
pkgrel=1
pkgdesc="A sudoku helper written in Java"
arch=('any')
url=('http://hodoku.sourceforge.net')
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
conflicts=('hodoku')

_PKGNAME=hodoku
_PKGCLASS=HoDoKu

source=("http://downloads.sourceforge.net/project/$_PKGNAME/$_PKGNAME/${_PKGNAME}_${pkgver}/$_PKGNAME-${pkgver//./-}-src.zip"
        "$_PKGNAME.sh"
        "$_PKGNAME.desktop")
md5sums=('175efa11ef9eedc2995b4446d7008502'
         '883f82c99d42ad5113e84c6a501a66b5'
         '557ca158902fddf06cbda7c7c9480c08')

build()
{
    cd "$srcdir/$_PKGCLASS"
    ant jar
}

package()
{
    cd "$srcdir/$_PKGCLASS"
    install -m 644 -D "dist/$_PKGCLASS.jar" \
        "$pkgdir/usr/share/java/$_PKGNAME/$_PKGNAME.jar"
    install -m 644 -D "src/img/${_PKGNAME}02-256.png" \
        "$pkgdir/usr/share/pixmaps/$_PKGNAME.png"
    install -m 755 -D "$srcdir/$_PKGNAME.sh" \
        "$pkgdir/usr/bin/$_PKGNAME"
    install -m 644 -D "$srcdir/$_PKGNAME.desktop" \
        "$pkgdir/usr/share/applications/$_PKGNAME.desktop"
}
