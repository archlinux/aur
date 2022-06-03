# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=farpdf-git
pkgver=v0.1.r29.g15cc8d7
pkgrel=1
pkgdesc="A experimental PDF software designed for serious readers."
arch=('i686' 'x86_64')
url="https://gitlab.com/slbtty/far2"
license=('AGPL3')
depends=('libmupdf' 'qt6-base')
makedepends=(git cmake ninja)
conflicts=('farpdf')
provides=('farpdf')
replaces=()
source=("$pkgname::git+https://gitlab.com/slbtty/far2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
}

build(){
	cd "$srcdir/$pkgname"
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build 
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
