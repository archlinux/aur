# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: petitstrawberry <petitstrawberry.dev@gmail.com>
pkgname=minibook-support-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=1.3.1.r12.74d0767
pkgrel=1
pkgdesc="Software for CHUWI MiniBook (8-inch) / MiniBook X (10-inch) running Linux"
arch=('any')
url="https://github.com/petitstrawberry/minibook-support"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="minibook-support.install"
source=('git+https://github.com/petitstrawberry/minibook-support.git')
noextract=()
sha256sums=('SKIP')

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
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/usr/bin" install-executable
    make DESTDIR="$pkgdir/usr/lib/systemd/system" install-service
}
