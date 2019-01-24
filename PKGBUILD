# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <vincent-3.brouillard@polymtl.ca>
pkgname=libnavajo-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v1.5.r38.1180842
pkgrel=1
pkgdesc="Framework to develop easily web interfaces for C++ application"
arch=('any')
url="https://github.com/titi38/libnavajo"
license=('CeCILL-C')
depends=('openssl')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/titi38/libnavajo.git')
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

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake .
	make
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
