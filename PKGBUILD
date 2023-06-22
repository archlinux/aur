# Maintainer: Tom Hu <tom@bluespice.org>
pkgname=xcursor-viewer-git
pkgver=r19.6b8a95a
pkgrel=1
pkgdesc="view xcursor files in list"
arch=('x86_64')
url="https://github.com/drizt/xcursor-viewer"
license=('GPL')
groups=()
depends=(glibc gcc-libs qt5-base)
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/drizt/xcursor-viewer#branch=master')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-CS}.patch"
#}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake --install-prefix /usr -B . -S .
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	#make -k check
	make cmake_check_build_system
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
