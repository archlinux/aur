# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=slstatus-git
_pkgname=slstatus
pkgver=r330.7246dc4
pkgrel=1
pkgdesc='A status monitor for window managers'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/slstatus'
depends=('libx11')
license=('MIT')
source=("git+https://git.suckless.org/$_pkgname"
		"config.h")
md5sums=('SKIP'
		 'SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp config.h $srcdir/$_pkgname
}

build() {
	cd $srcdir/$_pkgname
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/$_pkgname
	make DESTDIR="${pkgdir}" PREFIX='/usr/' install
}
