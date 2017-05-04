# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=spim-keepstats-git
pkgver=r11.9d7acf2
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url=""
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/ostrichjockey/spim-keepstats')
noextract=()
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
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/spim"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/spim"
	make -k test
}

package() {
	cd "$srcdir/${pkgname%-git}/spim"

	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir" install

	mkdir -p "$pkgdir/usr/share/man/man1"
	make DESTDIR="$pkgdir" install-man
}
