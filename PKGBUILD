# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=libretro-tyrquake-git
pkgver=r1597.1b494ee
pkgrel=1
pkgdesc="Tyrquake libretro core (Quake)."
arch=('i686' 'x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=(sdl2)
makedepends=(git)
source=("git+https://github.com/libretro/tyrquake.git" "https://raw.github.com/libretro/libretro-super/master/dist/info/tyrquake_libretro.info")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd tyrquake
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd tyrquake
	make QBASEDIR=/usr/share/games/quake
}

package() {
	install -Dm644 "tyrquake/tyrquake_libretro.so" "${pkgdir}/usr/lib/libretro/tyrquake_libretro.so"
	install -Dm644 "tyrquake_libretro.info" "${pkgdir}/usr/lib/libretro/tyrquake_libretro.info"
}
