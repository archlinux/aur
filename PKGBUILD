# Maintainer: Tomasz Kramkowski <tk@the-tk.com>
pkgname=timer-git
pkgver=r104.365f022
pkgrel=1

pkgdesc='Simple beeping countdown timer'
arch=('i686' 'x86_64')
url='https://github.com/EliteTK/c-stuff/blob/master/timer.c'
license=('GPL3')
depends=('glibc')

source=('git+https://github.com/EliteTK/c-stuff.git')

md5sums=('SKIP')

pkgver() {
	cd c-stuff

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C c-stuff LDLIBS=-lrt timer
}

package() {
	make -C c-stuff DESTDIR="$pkgdir" prefix=/usr target=timer install
}
