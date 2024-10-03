# Maintainer: Péter Bohner <peter@bohner.me>
pkgname=gf2-git
pkgver=r322.40f2ae6
pkgrel=1
pkgdesc="A GDB frontend for Linux."
arch=('x86_64' 'i686')
url="https://github.com/nakst/gf"
license=('MIT')
depends=('gdb' 'freetype2' 'libx11')
optdepends=('vim: enhanced source viewing')
makedepends=('git')
provides=("gf2")
conflicts=("gf2")
source=('gf::git+https://github.com/nakst/gf.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/gf"
	cp "extensions_v5/extensions.cpp" .
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/gf"
	./build.sh
}
check() {
	cd "$srcdir/gf"
	[ -e ./gf2 ]
}
package() {
	cd "$srcdir/gf"
	install -D gf2 "$pkgdir/usr/bin/gf2"
}
