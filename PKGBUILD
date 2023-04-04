# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libinsn-git
_pkg="${pkgname%-git}"
pkgver=30.r6.ge795956
pkgrel=1
pkgdesc='Instruction decoder/encoder for 64bit ARM'
arch=(x86_64)
url='https://github.com/tihmstar/libinsn'
license=(LGPL2.1)
depends=(libgeneral gcc-libs)
makedepends=(clang git)
provides=("$_pkg.so" "$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=(SKIP)

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	## Will not compile with gcc
	cd "$_pkg"
	export CC=clang
	export CXX=clang++
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$_pkg"
	make DESTDIR="$pkgdir/" install
}
