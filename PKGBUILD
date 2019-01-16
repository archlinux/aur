# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=nautilus-tmsu-rs-git
pkgver=v0.5.0.r0.4320690
pkgrel=1
pkgdesc="Nautilus extension to support TMSU"
arch=('any')
url="https://github.com/talklittle/tmsu-nautilus-rs"
license=('GPL3')
depends=('tmsu' 'gtk3' 'nautilus' 'libnautilus-extension')
makedepends=('git' 'rust')

groups=()

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('nautilus-tmsu-rs::git+https://github.com/talklittle/tmsu-nautilus-rs.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make compile
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}


