# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=slstatus-git
pkgver=r330.7246dc4
pkgrel=2
pkgdesc='A status monitor for window managers'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/slstatus'
depends=('libx11')
makedepends=('git')
license=('MIT')
source=("git+https://git.suckless.org/${pkgname%-git}"
        "config.h")
md5sums=('SKIP'
         '03f3780eb2db5ba676bada1e90910331')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp config.h $srcdir/${pkgname%-git}
}

build() {
	cd ${pkgname%-git}
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="${pkgdir}" PREFIX='/usr/' install
}
