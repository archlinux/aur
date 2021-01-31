# Maintainer: Gregory Dushkin (GregTheMadMonk) <yagreg7@gmail.com>
pkgname=noaftodo-git
pkgver=1.4.6r364.b21b712
pkgrel=1
pkgdesc="An ncurses TODO manager that No-One-Asked-For."
arch=(x86_64 i686)
url="https://github.com/gregthemadmonk/noaftodo.git"
license=('GPL3')
depends=(ncurses)
makedepends=(git cmake make sed)
optdepends=('libnotify: provides notify-send commandused in default config' 
		'dunst: possible notification daemon for notify-send to work')
source=("git+$url#branch=pkg")
changelog=CHANGELOG
md5sums=('SKIP')

pkgver() {
	cd noaftodo
	printf "1.4.6r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir noaftodo/build
	cd noaftodo/build
	PKGNAME="$pkgname" PKGROOT="$pkgdir" V_SUFFIX="AURr$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" cmake .. && make
}

package() {
	cd noaftodo/build
	make install
}
