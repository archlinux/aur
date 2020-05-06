# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=discord-overlay-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r34.24f434d
pkgrel=1
pkgdesc="QT5 Overlay for discord"
arch=('x86_64')
url="https://github.com/trigg/DiscordOverlayLinux"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'qt5-webengine' 'python-pyqtwebengine' 'python-pyqt5') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('discord-overlay::git+https://github.com/trigg/DiscordOverlayLinux')
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
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


package() {
	install -m 0755 -D -T "$srcdir/${pkgname%-git}/overlay-qt5.py" "$pkgdir/usr/bin/discord-overlay"
}
