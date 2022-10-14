# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rcssserver-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=17.0.1
pkgrel=1
pkgdesc="Robocup 2D simulator."
arch=('any')
url="https://github.com/rcsoccersim/rcssserver"
license=('GPL')
groups=('rcss')
depends=('boost-libs>=1.44' 'bison' 'flex')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('rcssserver-git::git+https://github.com/rcsoccersim/rcssserver.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	# Git, tags available
	printf "%s" "$(git describe --tags | sed 's/rcssserver-//' | sed 's/-.*//')"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
