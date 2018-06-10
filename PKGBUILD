# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: BrainDamage

pkgname=libretro-reicast-oit-git
pkgver=r2771.f0be7401
pkgrel=1
pkgdesc="libretro implementation of Reicast Sega Dreamcast Emulator (OIT version)"
arch=('i686' 'x86_64')
url="https://github.com/libretro/reicast-emulator"
license=('GPL2' 'LGPL')
makedepends=('git' 'mesa')
depends=('alsa-lib' 'libgl' 'glibc' 'gcc-libs')
groups=('libretro')
provides=('libretro-reicast')
conflicts=('libretro-reicast')
source=("git://github.com/libretro/reicast-emulator.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/reicast-emulator"
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/reicast-emulator"
	make HAVE_OIT=1
}

package() {
	install -Dm644 "${srcdir}/reicast-emulator/reicast_libretro.so" "${pkgdir}/usr/lib/libretro/reicast_libretro.so"
}
