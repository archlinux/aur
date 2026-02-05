# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=nethack4
pkgver=4.3.0.beta2
_pkgver=4.3-beta2
pkgrel=4
pkgdesc="A modern fork of Nethack"
arch=('i686' 'x86_64')
url="http://nethack4.org/"
license=('custom')
depends=('jansson' 'gcc-libs')
#makedepends=('sdl2' 'libpng' 'chrpath')
makedepends=('chrpath')
#optdepends=('sdl2: tiles'
#            'libpng: tiles')
source=("http://nethack4.org/media/releases/nethack4-$_pkgver.tar.gz" "hotfix.zip" "no-implicit.patch")
md5sums=('737403ba07a18fe3030a153471ba223d'
         'd657e32b061443c2c9ecdf3dfa6fc305'
         '348abd9e379a0086705160fff881eeac')

# postgresql-libs: multiuser server
prepare() {
	cd "$srcdir/$pkgname-$_pkgver"
	patch -p1 -i "$srcdir/no-implicit.patch"
	unzip "$srcdir/hotfix.zip"
}
build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make
}
package() {
  	cd "$srcdir/$pkgname-$_pkgver"
  	make install
	chmod 777 /var/games/nethack4/save
}
