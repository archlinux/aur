# Maintainer: Nícolas F. R. A. Prado <nfraprado at protonmail dot com>
pkgname=bindmap-git
pkgver=v1.0.0.r0.74a5d4b
pkgrel=1
pkgdesc="A binding visualizer for the i3 window manager"
arch=('i686' 'x86_64')
url="https://gitlab.com/nfraprado/bindmap"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('bindmap::git+https://gitlab.com/nfraprado/bindmap.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
