# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: mar77i <mysatyre at gmail dot com>

pkgname=qosmic
pkgver=1.5.0
pkgrel=3
pkgdesc="An application for creating, editing, and rendering flam3 fractal images"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qosmic/"
license=('GPL')
depends=('qt4' 'lua52' 'flam3')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2" "lua52.patch")
md5sums=('806d6ffc00a073d47d47fc70ca0de868'
         'fb9fd4d91eff5c263a2d792383aac399')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s@^\(.*link_pkgconfig\)\$@# \1@g; s_PREFIX = /usr_PREFIX = $pkgdir/usr_g; s_DESTDIR = ._DESTDIR = _g" qosmic.pro
  patch -Np1 <../lua52.patch
  qmake-qt4
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
