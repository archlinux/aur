# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=asylum
pkgver=0.3.2
pkgrel=3
pkgdesc="A platform shooter set in the surreal world of an unstable mind"
arch=('i686' 'x86_64')
url="http://sdl-$pkgname.sourceforge.net/"
license=('GPL3' 'Public Domain')
depends=('sdl' 'sdl_mixer' 'mesa')
source=(http://downloads.sourceforge.net/sdl-$pkgname/$pkgname-$pkgver.tar.gz \
	Makefile.diff \
	LICENSE asylum.desktop)
md5sums=('e662061a48726a16884a6f5d3ce69170'
         '3de3e16b424e8ec93ce6637ae6667075'
         '88b0414ed9959301d11e28924475a4db'
	 '9fee7121c0c0da6ea2ffb6fd6540e49e')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i ../Makefile.diff 
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/applications
  cp ../asylum.desktop $pkgdir/usr/share/applications
}
