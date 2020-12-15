# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname='easymake-git'
pkgver=r151.21f6ec5
pkgrel=1
pkgdesc="A simple replacement to GNU Make or CMake."
arch=('x86_64')
url="https://cleanware.github.io/"
license=('GPL')
groups=()
depends=('gcc')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/cleanware/easymake.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/easymake"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Bazaar

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
}

prepare() {
	cd "$srcdir/easymake"
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/easymake"
	gcc src/*.c src/cutils/*.c -Iinclude -Iinclude/cutils -s -Ofast -o easymake
}

check() {
	cd "$srcdir/easymake"
	#make -k check
}

package() {
	cd "$srcdir/easymake"
	#make DESTDIR="$pkgdir/" install
	sudo cp easymake /usr/bin/
	chmod +x /usr/bin/easymake
}
