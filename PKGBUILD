# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=2024.01.10
pkgrel=1
pkgdesc='Online chess game client written in Qt'
url='https://textbrowser.github.io/qtchess/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qt5-base' 'libgl')
makedepends=('qt5-tools')
source=(qtchess-${pkgver}.tar.gz::"https://github.com/textbrowser/qtchess/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5e224ed30af39fe9ec03b2546148a6986a966aa96ac65b22c1d3ee85e2bd24cc')

prepare () {
	cd "$srcdir/qtchess-${pkgver}"
  sed '/-Werror/d' < qtchess.pro > qtchess.pro.fixed
  head -n 26 Source/qtchess_main.cc > LICENSE
}

build () {
  cd "$srcdir/qtchess-${pkgver}"
  qmake-qt5 -o Makefile qtchess.pro.fixed
  make
}

package () {
  cd "$srcdir/qtchess-${pkgver}"
  mkdir -p -- "${pkgdir}/usr/bin/"
  cp -- QtChess "${pkgdir}/usr/bin/qtchess"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
