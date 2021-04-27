# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=star-ruler2-modpack # '-bzr', '-git', '-hg' or '-svn'
pkgver=r199.197b6a9
pkgrel=1
pkgdesc="Star Ruler 2 Community Patch"
arch=(any)
url="https://github.com/OpenSRProject/OpenStarRuler-Modpack"
license=('GPL')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('star-ruler2-modpack::git+https://github.com/OpenSRProject/OpenStarRuler-Modpack.git')
md5sums=('SKIP')
noextract=()

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

# prepare() {
#   cd "$srcdir/${pkgname%-git}"
#   patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
# }

# build() {
#   ./autogen.sh
#   ./configure --prefix=/usr
#   make
# }

# check() {
#   cd "$srcdir/${pkgname%-VCS}"
#   make -k check
# }

package() {
  install -d $pkgdir/opt/starruler2/mods
  cd "$srcdir/${pkgname%-git}"
  cp -r "OpenSR" $pkgdir/opt/starruler2/mods
  # make DESTDIR="$pkgdir/" install
}
