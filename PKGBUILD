# Maintainer: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=vpaint
pkgver=1.5
pkgrel=1
pkgdesc='VPaint is an experimental vector graphics editor based on the Vector Animation Complex technology.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt4' 'glu' 'qt5-base' 'libxkbcommon-x11')
makedepends=('gcc' 'make')
url='http://www.vpaint.org'
conflicts=('vpaint-git')
provides=()
source=("https://github.com/dalboris/vpaint/archive/v$pkgver.tar.gz")
md5sums=('aee4b49c9a9a0345a1d98d734a008b7d')
options=()

build() {
    mkdir -p "$srcdir/$pkgname-$pkgver/build"
    cd       "$srcdir/$pkgname-$pkgver/build"

    export CXXFLAGS="$CXXFLAGS -fPIC"
    export QT_SELECT=5

    qmake ../src/VPaint.pro -r -spec linux-g++
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin"

    install -Dm755 "$srcdir/$pkgname-$pkgver/build/VPaint" "$pkgdir/usr/bin/vpaint"
}
