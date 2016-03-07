# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Arthur Titeica <arthur dot titeica at gmail dot com>

pkgname=ttfautohint
pkgver=1.5
pkgrel=1
pkgdesc="Provides automated hinting process for web fonts."
arch=('i686' 'x86_64')
url="http://www.freetype.org/ttfautohint/"
license=('GPL' 'custom')
depends=('freetype2' 'qt4')
optdepends=('texlive-bin: generate docs'
            'pandoc: generate docs'
            'ghc: pandoc filter')
source=(http://download.savannah.gnu.org/releases/freetype/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('644fe721e9e7fe3390ae1f66d40c74e4459fa539d436f4e0f8635c432683efd1'
            'SKIP')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export QMAKE='/usr/bin/qmake-qt4'
  export MOC='/usr/bin/moc-qt4'
  export UIC='/usr/bin/uic-qt4'
  export RCC='/usr/bin/rcc-qt4'
  # export QTDIR='/usr/lib/qt4'
  # CFLAGS="-I/usr/include/qt4"
  ./configure --prefix=/usr --with-qt=/usr/lib/qt4
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 FTL.TXT "${pkgdir}/usr/share/licenses/${pkgname}/FTL.TXT"
}
