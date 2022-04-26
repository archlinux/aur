# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wake-build-git
pkgver=r15.8b86501
pkgrel=1
pkgdesc="WAKE build system writen in rust"
arch=(x86_64)
url="https://github.com/mrquantumoff/wake"
license=('BSD 2 Clause')
groups=("mrquantumoff")
depends=("bash")
makedepends=('git' 'cargo' 'make')
optdepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=(git+https://github.com/mrquantumoff/wake.git)
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd $srcdir/wake

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

# Mercurial
	#printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

# Subversion
	#printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/wake"
}

build() {
	cd ${srcdir}/wake
	make
}

package() {
	cd "$srcdir/wake"
	install -Dm755 -t "${pkgdir}/usr/bin/" target/debug/wake 
	chmod +x ${pkgdir}/usr/bin/wake
}
