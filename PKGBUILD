# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=2021.03.15
pkgrel=1
pkgdesc='Online chess game client written in Qt'
url='https://textbrowser.github.io/qtchess/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
# (license notice included in qtchess_main.cc)
depends=('qt5-base' 'libgl')
makedepends=('qt5-base' 'libgl' 'qt5-tools')
source=(qtchess-${pkgver}.tar.gz::"https://github.com/textbrowser/qtchess/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b67e182beca7d203dd07b995a6d4cae752dc42ed76439694e1befe5d6bd5f2be')


build()
{
    cd "$srcdir/qtchess-${pkgver}"
    qmake-qt5 -o Makefile qtchess.pro
    make
    sed -i s_'-Werror'__g Makefile # stack protector is not proctecting small arrays
    make
}

package()
{
    cd "$srcdir/qtchess-${pkgver}"
    mkdir -p -- "${pkgdir}/usr/bin/"
    cp -- QtChess "${pkgdir}/usr/bin/qtchess"
}
