# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=atmosim
pkgver=2.4
pkgrel=1
pkgdesc="A CLI maxcap calculator for Space Station 14"
arch=(any)
url="https://github.com/Ilya246/atmosim"
license=('GPL-3.0-or-later')
makedepends=(git)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	CXXFLAGS="-O3 -ffast-math -flto=auto -Wall -Wextra -pedantic -g -c -std=c++20" # why tf does makefile use ?=
	make -j
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 out/$pkgname $pkgdir/usr/bin/$pkgname
	install -dm755 $pkgdir/etc/$pkgname # create config directory
	install -m644 configs/* $pkgdir/etc/$pkgname/ # copy configs
}
