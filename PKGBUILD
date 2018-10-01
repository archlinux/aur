# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Jeong Arm <kjwonmail@gmail.com>
pkgname=libhangul-3beol
_pkgname=libhangul
pkgver=libhangul.0.1.0.r45.5244cb3
pkgrel=1
pkgdesc="libhangul alternatives"
arch=('x86_64')
url="https://gitlab.com/3beol/libhangul.git"
license=('LGPL')
groups=()
depends=()
makedepends=('git' 'binutils' 'intltool' 'automake' 'autoconf' 'gcc' 'make')
provides=('libhangul')
conflicts=('libhangul')
replaces=()
backup=()
options=()
install=
source=('https://gitlab.com/3beol/libhangul.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/libhangul"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	echo "$pkgdir/"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$_pkgname"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
