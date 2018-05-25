# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=babl-git
pkgver=0.1.50.3.g24d7ba9
pkgrel=1
pkgdesc="babl is a dynamic, any to any, pixel format translation library."
arch=('i686' 'x86_64')
url="http://www.gegl.org/babl"
license=('LGPL3')
depends=('glibc')
makedepends=('git') # meson
provides=("babl=${pkgver}")
conflicts=('babl')
options=(!libtool)
source=(git+https://gitlab.gnome.org/GNOME/babl)
md5sums=('SKIP')

_gitroot=GITURL
_gitname=babl

# Don't port to meson until babl's runtime cpu detection works there

build() {
	cd "$srcdir/$_gitname"

	#meson builddir --prefix=/usr/ -Denable-tests=false
	#meson builddir --prefix=/usr/ -Denable-tests=false
	./autogen.sh --prefix=/usr --disable-docs
	make
}

package() {
	cd "$srcdir/$_gitname"

	#DESTDIR="${pkgdir}" ninja -C builddir install
	make DESTDIR="$pkgdir/" install
}

pkgver() {
	cd "${srcdir}/babl"
	git describe --always | sed -e 's/BABL_//g' -e 's/[_-]/./g'
}
