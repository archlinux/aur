# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rcssmonitor-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=17.0.0
pkgrel=1
pkgdesc="Robocup 2D simulator's monitor."
arch=('any')
url="https://github.com/rcsoccersim/rcssmonitor"
license=('GPL')
groups=('rcss')
depends=('qt5-base' 'fontconfig' 'libxt' 'glib2' 'libxi' 'libxrender')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('rcssmonitor-git::git+https://github.com/rcsoccersim/rcssmonitor.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	# Git, tags available
	printf "%s" "$(grep AC_INIT configure.ac | cut -d '[' -f 3 | sed 's/],//g')"
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
