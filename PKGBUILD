# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Menelkir <menelkir@itroll.org>
# Contributor: Tomasz Paś <kierek93@gmail.com>
_pkgname=libretro-melonds
pkgname=$_pkgname-git
pkgver=r1802.657c729
pkgrel=1
epoch=1
pkgdesc='Nintendo DS core'
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/melonDS"
license=('GPL3')
groups=('libretro')
depends=('libgl' 'libretro-core-info')
makedepends=('gcc10' 'git' 'libglvnd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# https://github.com/Arisotura/melonDS/issues/1103
	# https://github.com/libretro/melonDS/issues/110
	CFLAGS="$CFLAGS -Wa,--noexecstack" CC=gcc-10 CXX=g++-10 make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/melonds_libretro.so
}
