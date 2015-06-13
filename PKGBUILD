# Contributor: Jakub Luzny <limoto94@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=sl-git
_gitname=sl
pkgver=5.02.r0.g0fd8d6f
pkgrel=1
pkgdesc='Steam Locomotive runs across your terminal when you type "sl" as you meant to type "ls"'
arch=('i686' 'x86_64' 'arm')
url="http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html"
license=('free')
depends=('ncurses')
makedepends=('git')
provides=('sl')
conflicts=('sl')
source=("git://github.com/mtoyoda/sl.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"

	cc $CFLAGS -o sl sl.c -lcurses
	gzip -9 -f sl.1
}

package() {
	cd "$_gitname"

	install -Dm 775 sl "$pkgdir/usr/bin/sl"
	install -Dm 644 sl.1.gz "$pkgdir/usr/share/man/man1/sl.1.gz"
}

#category: games
# vim:set ts=2 sw=2 et:
