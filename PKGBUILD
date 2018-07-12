# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=babl-git
pkgver=0.1.52.23.ga0dba44
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format translation library."
arch=('i686' 'x86_64')
url="http://www.gegl.org/babl"
license=('LGPL3')
depends=('glibc')
makedepends=('git') # meson
provides=("babl=${pkgver}")
conflicts=('babl')
source=(git+https://gitlab.gnome.org/GNOME/babl)
md5sums=('SKIP')

_gitroot=GITURL
_gitname=babl

prepare() {
	cd "$srcdir"/$_gitname
	autoreconf -fi
	./configure --prefix=/usr
}

build() {
	cd "$srcdir"/$_gitname
	make
}

package() {
	cd "$srcdir"/$_gitname
	make DESTDIR="$pkgdir" install
}

pkgver() {
	cd "$srcdir"/babl
	git describe --always | sed -e 's/BABL_//g' -e 's/[_-]/./g'
}
