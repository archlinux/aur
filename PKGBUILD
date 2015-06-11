# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=3.20
pkgrel=1
pkgdesc='Online chess game client written in Qt'
url='http://qtchess.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
# (license notice included in qtchess_main.cc)
depends=('qt5-base' 'libgl')
makedepends=('qt5-base' 'libgl' 'qt5-tools')
source=("http://downloads.sourceforge.net/project/qtchess/Version%20${pkgver}/QtChess.d.tar.gz")
sha256sums=('9ac063d68dc880363ebedc64f12a01ec2032cebd9c969ed711c0ec8db95db254')


build()
{
    cd "$srcdir/qtchess.d"
    qmake-qt5 -o Makefile qtchess.pro
    sed -i s_'-Werror'__g Makefile # stack protector is not proctecting small arrays
    make
}

package()
{
    cd "$srcdir/qtchess.d"
    install -Dm755  QtChess -- "${pkgdir}/usr/bin/qtchess"
}

