# Maintainer: Daniel Renninghoff <renninghoff AT archlinux DOT info>
# Contributor: gucong <gucong43216@gmail.com>
# Contributor: P. A. López-Valencia <palopezv AT gmail DOT com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=hoichess
pkgver=0.22.0
pkgrel=2
pkgdesc="Xboard compatible chess engine and xiangqi (Chinese chess) engine"
arch=('x86_64')
license=('GPL2')
url="http://www.hoicher.de/hoichess"
depends=()
makedepends=('wget')
source=(${url}/download/${pkgname}-${pkgver}-gpl.tar.gz)
md5sums=('a7165b2be2708069f204c20da5b3389e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/games$/bin/' Makefile
  sed -i 's/CXXFLAGS\ =/CXXFLAGS\ +=/' src/Makefile
  cd "book"
  sh "download-gnuchess-book"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
