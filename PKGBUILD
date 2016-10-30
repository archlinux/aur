# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=asylum
pkgver=0.3.2
pkgrel=4
pkgdesc="A platform shooter set in the surreal world of an unstable mind"
arch=('i686' 'x86_64')
url="http://sdl-$pkgname.sourceforge.net/"
license=('GPL3' 'custom:Public Domain')
depends=('sdl' 'sdl_mixer' 'mesa' 'glu')
source=(http://downloads.sourceforge.net/sdl-$pkgname/$pkgname-$pkgver.tar.gz
	Makefile.diff
	LICENSE
        asylum.desktop)
md5sums=('e662061a48726a16884a6f5d3ce69170'
         '3de3e16b424e8ec93ce6637ae6667075'
         '88b0414ed9959301d11e28924475a4db'
         '9fee7121c0c0da6ea2ffb6fd6540e49e')

prepare() {
  cd $pkgname-$pkgver

  patch -Np0 -i ../Makefile.diff
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ../asylum.desktop "$pkgdir"/usr/share/applications/asylum.desktop
}
