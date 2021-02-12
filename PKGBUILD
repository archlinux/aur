# Maintainer: zuyoutoki <zuyoutoki+aur at oki dot moe>
pkgname=romog-git
pkgver=r14.eca8fe1
pkgrel=1
pkgdesc="A command-line ROM manager written in C++, specifically for Linux. "
arch=('x86_64')
url="https://github.com/xprism1/romog"
license=('AGPL3')
depends=('pugixml' 'xalan-c' 'libarchive' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
provides=('romog')
source=("git+https://github.com/xprism1/romog")
md5sums=('SKIP')
options=(!strip)

prepare() {
	cd "$srcdir/romog/src"
	sed 's/xalanc_1_11/xalanc_1_12/g' dir2dat.cpp > dir2dat.cpp.patched
	mv dir2dat.cpp.patched dir2dat.cpp
	mkdir -p obj
}

pkgver() {
	cd "$srcdir/romog"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/romog/src"
	make
}

package() {
	cd "$srcdir/romog/src"
	mkdir -p "$pkgdir/usr/bin"
	cp -f romog "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/bin"
}
