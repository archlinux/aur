# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=vislcg3-svn
pkgver=1.3.2.r16867
pkgrel=1
pkgdesc="Compiler and parser for Constraint Grammar (CG), a paradigm for robust, rule-based Natural Language Parsing."
url="https://visl.sdu.dk/cg3.html"
license=('GPL3')
makedepends=('boost' 'gperftools' 'cmake' 'subversion')
depends=('icu')
provides=("vislcg3=${pkgver}")
conflicts=('vislcg3')
optdepends=('perl: cg3-autobin.pl auto-compile-and-run wrapper')
arch=('i686' 'x86_64')
source=("svn+https://visl.sdu.dk/svn/visl/tools/vislcg3/trunk")
sha256sums=('SKIP')
install='vislcg3-svn.install'

package () {
	cd "$srcdir/trunk"
	make DESTDIR="$pkgdir/" install
}

build() {
	cd "$srcdir/trunk"
	./cmake.sh --prefix=/usr
	make
}

_getvar() {
	echo $(grep "$1" src/version.hpp | awk -F'[=;]' '{gsub(/ /, "", $2);print $2}')
}

pkgver() {
	cd "$srcdir/trunk"
	local major=$(_getvar CG3_VERSION_MAJOR)
	local minor=$(_getvar CG3_VERSION_MINOR)
	local patch=$(_getvar CG3_VERSION_PATCH)
	local ver="$(svnversion)"
	printf "%s.%s.%s.r%s" "$major" "$minor" "$patch" "${ver//[[:alpha:]]}"
}
