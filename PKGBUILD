# Maintainer: Libre Liu <libreliu@foxmail.com>

pkgname=objgui-git
pkgver=r120.56beadc
pkgrel=1
pkgdesc="ObjGui is a GUI disassembler and binary analysis tool utilizing GNU binutils. "
arch=('x86_64')
url="https://github.com/jubal-R/ObjGui"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('objgui::git+https://github.com/jubal-R/ObjGui')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	true
}

build() {
	cd "$srcdir/${pkgname%-git}"
	rm -r build || true
	mkdir build
	cd build
	qmake ../src/ObjGui.pro
	make
}

check() {
	true
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	install -D -m755 ObjGui "$pkgdir"/usr/bin/ObjGui
}
