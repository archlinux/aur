# Contributor: Kristian Setälä <kristian.setala@gmail.com>

pkgname=tagainijisho
pkgver=1.0.3
pkgrel=1
pkgdesc="A Free Japanese dictionary and study assistant"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.tagaini.net/"
license=('GPL3')
depends=('qt4>=4.7' 'sqlite3>=3.7.9')
makedepends=('cmake>=2.8.1' 'desktop-file-utils')
source=(https://github.com/Gnurou/tagainijisho/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('e3aef7b1a3e4a38e0f144dd98fdcb680')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS=`echo $CFLAGS | sed 's/-ffast-math//'` cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 . || return 1
  make $MAKEFLAGS || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}
# vim:set ts=2 sw=2 et:
