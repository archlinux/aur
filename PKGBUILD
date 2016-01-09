# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>
# Maintainer: Feodor Alexeev aka moskupols <feodor.alexeev@gmail.com>
pkgname=hayai-git
pkgver=r132.e534276
pkgrel=1
pkgdesc="Benchmarking framework for c++ inspired by googletest"
arch=('any')
url="https://github.com/nickbruun/hayai"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('hayai::git+https://github.com/nickbruun/hayai.git')
noextract=()
md5sums=('SKIP')

BUILDENV+=('!check')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.
# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# patch -p1 -i "$srcdir/${pkgname%-git}.patch"
    mkdir build && cd build

	cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_CMAKE_DIR:STRING=lib/cmake/hayai ..
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	make
}

check() {
    cd "$srcdir/${pkgname%-git}/build"
    make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}

