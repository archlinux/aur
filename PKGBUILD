# Maintainer: Auguste Pop < auguste [at] gmail [dot] com >
# Contributor: P. Badredin <p dot badredin at gmail dot com>
# Contributor: Justin Blanchard <UncombedCoconut at gmail dot com>

pkgname=stockfish
pkgver=7
pkgrel=1
epoch=1
pkgdesc="A strong chess engine written by Tord Romstad, Marco Costalba, Joona Kiiski"
arch=('i686' 'x86_64')
url="http://stockfishchess.org/"
license=('GPL3')
install=${pkgname}.install
_pkgfilename=${pkgname}-${pkgver}-src
source=("http://stockfish.s3.amazonaws.com/${_pkgfilename}.zip")
md5sums=('41f1410820192466d15166712181ae03')

build()
{
    cd "$srcdir/${_pkgfilename}/src"

    if [[ "$CARCH" == "i686" ]];
    then
        _arch=x86-32
    elif grep popcnt /proc/cpuinfo 2>&1
    then
        _arch=x86-64-modern
    else
        _arch=x86-64
    fi
    make profile-build ARCH=$_arch
}

package()
{
    cd "$srcdir/${_pkgfilename}/src"
    make PREFIX="$pkgdir/usr" install
}
