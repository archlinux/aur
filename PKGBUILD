# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Kim Tore Jensen <kimtjen.at.gmail.dot.com>

_pkgname=pms
pkgname=pmus
pkgver=415.492d376
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable ncurses-based MPD client written in C++."
url="https://ambientsound.github.io/pms/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'glib2')
makedepends=('git' 'libmpdclient')
source=(pms::git+https://github.com/ambientsound/pms.git#branch=master)
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {

	cd ${srcdir}/${_pkgname}
  sed -i 's/configure/configure \-\-prefix\=\/usr/' rebuild.sh
	./rebuild.sh --prefix=/usr || return 1
	#make || return 1

}

package() {
	cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
}
