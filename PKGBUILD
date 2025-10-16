# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=qtchess
pkgver=2025.05.19
pkgrel=2
pkgdesc='Online chess game client written in Qt'
url='https://textbrowser.github.io/qtchess/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qt5-base')
makedepends=('qt5-tools')
source=(qtchess-${pkgver}.tar.gz::"https://github.com/textbrowser/qtchess/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('329417fa3f6a5bbede7c542214c1af2703175da762c6efed4c04a27e549521b3')

prepare() {
  cd "$srcdir/qtchess-${pkgver}"
  sed '/-Werror/d' < qtchess.pro > qtchess.pro.fixed
  head -n 26 Source/qtchess_main.cc > LICENSE
}

build() {
  cd "$srcdir/qtchess-${pkgver}"
  qmake-qt5 -o Makefile qtchess.pro.fixed
  make
}

package() {
  cd "$srcdir/qtchess-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp QtChess "${pkgdir}/usr/bin/qtchess"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
