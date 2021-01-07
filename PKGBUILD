# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
pkgname=wolf-m7m-cpuminer-v2-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.293a024
pkgrel=1
pkgdesc="This is a multi-threaded CPU pool miner for M7M/Magi (XMG). This miner is an optimizing of code released by Wolf0 mainly by revising <m7mhash.c>."
arch=('any')
url="https://github.com/magi-project/wolf-m7m-cpuminer-V2"
license=('GPL2')
groups=()
depends=('curl' 'gmp' 'jansson' 'openssl-1.0')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}" "minerd")
conflicts=("${pkgname%-git}" "minerd")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/magi-project/wolf-m7m-cpuminer-V2.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Bazaar
	#printf "r%s" "$(bzr revno)"

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
	cd "$srcdir/${pkgname%-git}"
	
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	CFLAGS="-O3" CXXFLAGS=-"-O3" LDFLAGS="-L/usr/lib/openssl-1.0" ./configure --prefix=/usr
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
