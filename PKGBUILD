# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=par-git
pkgver=1.53.0.r0.eb0590f
pkgrel=1
pkgdesc="Adam M. Costello's paragraph reformatter, vaguely similar to fmt, but better."
arch=('x86_64')
url="http://www.nicemice.net/par/"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
_repo=upstream
source=('upstream::git+https://bitbucket.org/amc-nicemice/par.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$_repo"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  echo "?"
}

build() {
	cd "$_repo"
  make -f protoMakefile CC="cc -c" LINK1="cc" LINK2="-o" RM="rm" JUNK="" $*
}

check() {
	cd "$_repo"
  ./test-par ./par
}

package() {
	cd "$_repo"
  install -D -m755 "par" "$pkgdir/usr/bin/par"
}
