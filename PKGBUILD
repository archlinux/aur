# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-genesis-plus-gx-wide
pkgname=$_pkgname-git
pkgver=r1539.73c298b
pkgrel=3
pkgdesc="Sega CD/Game Gear/Master System/Mega Drive/SG-1000 core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/Genesis-Plus-GX-Wide"
license=('custom')
groups=('libretro')
depends=('glibc' 'libretro-core-info' 'libvorbis')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname -f Makefile.libretro SHARED_LIBVORBIS=1
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro genesis_plus_gx_wide_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.txt
}
