# Maintainer: Daniel Renninghoff <renninghoff AT archlinux DOT info>
# Contributor: gucong <gucong43216@gmail.com>
# Contributor: P. A. López-Valencia <palopezv AT gmail DOT com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=hoichess
pkgver=0.16.0
pkgrel=1
pkgdesc="Xboard compatible chess engine and xiangqi (Chinese chess) engine"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.hoicher.de/hoichess"
depends=()
source=(${url}/download/${pkgname}-${pkgver}-gpl.tar.gz)
md5sums=('0bea20843c30410de1f865b6efb15b85')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/games$/bin/' Makefile
  sed -i 's/CXXFLAGS\ =/CXXFLAGS\ +=/' src/Makefile
  sh "book/download-gnuchess-book"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
