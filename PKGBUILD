# Contributor: Kristian Setälä <kristian.setala@gmail.com>

pkgname=tagainijisho
pkgver=1.1.91
pkgrel=1
pkgdesc="A Free Japanese dictionary and study assistant"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://www.tagaini.net/"
license=('GPL3')
depends=('qt5-base>=5.15')
makedepends=('cmake>=2.8.1' 'desktop-file-utils' 'qt5-tools')
source=(https://github.com/Gnurou/tagainijisho/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('649dcf55ad5b5ac5a0224c8f2d2971b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS=`echo $CFLAGS | sed 's/-ffast-math//'` cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make $MAKEFLAGS || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}
# vim:set ts=2 sw=2 et:
