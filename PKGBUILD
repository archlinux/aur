# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=2022.11.20
pkgrel=1
pkgdesc='Online chess game client written in Qt'
url='https://textbrowser.github.io/qtchess/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qt5-base' 'libgl')
makedepends=('qt5-tools')
source=(qtchess-${pkgver}.tar.gz::"https://github.com/textbrowser/qtchess/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a791d80777d66ca40a7fefe28097920f9caf7c81b6e2a9a0870ee8cc04e4a687')

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
