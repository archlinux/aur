# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=2021.12.25
pkgrel=1
pkgdesc='Online chess game client written in Qt'
url='https://textbrowser.github.io/qtchess/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qt5-base' 'libgl')
makedepends=('qt5-base' 'libgl' 'qt5-tools')
source=(qtchess-${pkgver}.tar.gz::"https://github.com/textbrowser/qtchess/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3796b39bf01d2a3243f271e14a7aaad0baa61399a4ecb7fbe5868c5aed9dc4a2')

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
