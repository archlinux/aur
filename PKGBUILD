# Maintainer: Jared Baldridge <jrb@expunge.us>

pkgname=umbim-git
_gitname=umbim
pkgver=r17.29aaf43
pkgrel=1
pkgdesc='OpenWrt MBIM modem utility'
url='https://git.openwrt.org/project/umbim.git'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libubox')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('umbim')
provides=('umbim')
source=('git://git.openwrt.org/project/umbim.git' '001-sbin-fix.patch')
sha256sums=('SKIP' 'a37c0e353e4cac3c148689fc0ed8a737ba8f4555a7969f5b507df8f00fee3b6b')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/001-sbin-fix.patch"
}


build() {
	cd "$srcdir/$_gitname"
	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
