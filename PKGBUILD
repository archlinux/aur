# Contributor: Kristian Setälä <kristian.setala@gmail.com>

pkgname=tagainijisho
pkgver=1.2.2
pkgrel=1
pkgdesc="A Free Japanese dictionary and study assistant"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://www.tagaini.net/"
license=('GPL3')
depends=('qt5-base>=5.15')
makedepends=('cmake>=2.8.1' 'desktop-file-utils' 'qt5-tools')
source=(https://github.com/Gnurou/tagainijisho/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('4aa8842c5fa794dbb155b995432abf89')

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
