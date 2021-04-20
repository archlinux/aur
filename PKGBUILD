# Maintainer: Frank Tang <roadtang@gmail.com>
pkgname=hashlink-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1367.4c4de37
pkgrel=1
pkgdesc="A virtual machine for Haxe"
arch=(any)
url="https://hashlink.haxe.org/"
license=('MIT')
groups=()
depends=('libpng' 'libjpeg-turbo' 'libvorbis' 'openal' 'sdl2' 'mbedtls' 'libuv' 'glu')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('hashlink-git::git+https://github.com/HaxeFoundation/hashlink.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
#	patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
#	./autogen.sh
#	./configure --prefix=/usr
	make
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make PREFIX="$pkgdir/usr/" install
}
