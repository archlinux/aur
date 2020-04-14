# Maintainer: Mario Finelli <mario at finel dot li>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Arthur Titeica <arthur dot titeica at gmail dot com>

pkgname=ttfautohint
pkgver=1.8.3
pkgrel=2
pkgdesc='Provides automated hinting process for web fonts'
arch=('i686' 'x86_64')
url="http://www.freetype.org/$pkgname"
license=('GPL' 'custom')
depends=('freetype2' 'harfbuzz' 'qt5-base')
source=(https://download.savannah.gnu.org/releases/freetype/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('87bb4932571ad57536a7cc20b31fd15bc68cb5429977eb43d903fa61617cf87e'
            'SKIP')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

build() {
    cd "$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --without-doc \
        --with-qt=/usr/lib/qt \
        --with-freetype-config="pkg-config freetype2"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING FTL.TXT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "doc/$pkgname.pdf"
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" "frontend/$pkgname"{,GUI}.1
}
