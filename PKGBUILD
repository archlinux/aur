# Maintainer: erk <v at erk dot io>
pkgname=vnote
pkgver=1.16
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=('any')
url='https://tamlok.github.io/vnote/'
license=('MIT')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg')

_marked=38f1727ffee0820975677027b8968bc1954e6637
_hoedown=e63d2160a7d9895defc253d933b58a83ac54f81a

source=("https://github.com/tamlok/vnote/archive/v$pkgver.tar.gz" hoedown.zip::"https://github.com/tamlok/hoedown/archive/$_hoedown.zip" marked.zip::"https://github.com/markedjs/marked/archive/$_marked.zip")
sha256sums=(664972656e28dbd3e0ca1f443d4f27917df1f8954b0b012c34850e836c6ea2eb 85d8c673ee4a3e8f595db3021b238642aede1727965afa13666a29a43a0eb846 602c2e7fa2ab48d3aefe33cafa08bfdebbc619f4a652fde1ebad40f19c34a886)

package() {
    mv $srcdir/hoedown-$_hoedown/* "$srcdir/$pkgname-$pkgver/hoedown/"
    mv $srcdir/marked-$_marked/* "$srcdir/$pkgname-$pkgver/src/utils/marked/"
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build
    qmake-qt5 ../VNote.pro
    make
    make INSTALL_ROOT="$pkgdir" install
}
