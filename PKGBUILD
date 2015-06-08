# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='i7z-git'
_pkgname='i7z'
pkgver=5023138
pkgrel=2
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux. Git version."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt4' 'git')
optdepends=('qt4: for i7z-gui')
url="https://github.com/ajaiantilal/i7z"
provides='i7z'
conflicts='i7z'
source=("git://github.com/ajaiantilal/i7z.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "$_pkgname"
	sed -i '/^sbindir/ s,/sbin,/bin,'	Makefile
}

build() {
	cd "$_pkgname"
	make

	cd GUI
	qmake-qt4
	make clean
	make
}

package() {
	cd "$_pkgname"

	make install DESTDIR="$pkgdir"
	install -Dm755 GUI/i7z_GUI "$pkgdir/usr/bin/i7z-gui"
}
