# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Mikhail Ovchinnikov <gatraun at gmail dot com>
pkgname=gpx-git
pkgver=2.2.1.r196.d903700
pkgrel=1
pkgdesc="A post processing utility for converting gcode to x3g"
arch=('i686' 'x86_64')
url="https://github.com/markwal/GPX"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
	../configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
