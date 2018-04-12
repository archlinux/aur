# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=libretro-tyrquake-git
pkgver=r1676.a4f5e1c
pkgrel=1
pkgdesc="Tyrquake libretro core (Quake)."
arch=('i686' 'x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=('sdl2' 'libretro-core-info')
groups=('libretro')
makedepends=(git)
provides=('libretro-tyrquake')
conflicts=('libretro-tyrquake')
source=("git+https://github.com/libretro/tyrquake.git")
sha256sums=('SKIP')

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
}
