# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Kristian Buchman <kribuchman@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-mupen64plus-next
pkgname=$_pkgname-git
pkgver=r298.8827197
pkgrel=2
pkgdesc="Improved mupen64plus libretro core reimplementation"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/mupen64plus-libretro-nx"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'libgl' 'minizip' 'libpng' 'xxhash' 'zlib')
makedepends=('git' 'nasm')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('libretro-mupen64plus-nx-git')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	make HAVE_PARALLEL_RDP=1 HAVE_PARALLEL_RSP=1 HAVE_THR_AL=1 LLE=1 \
		SYSTEM_MINIZIP=1 SYSTEM_LIBPNG=1 SYSTEM_XXHASH=1 SYSTEM_ZLIB=1
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro mupen64plus_next_libretro.so
}
