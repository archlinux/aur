# Maintainer: BrainDamage

pkgname=libretro-reicast-git
pkgver=2352.e44e5e6
pkgrel=2
pkgdesc="libretro implementation of Reicast Sega Dreamcast Emulator"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/reicast-emulator"
license=('GPL2' 'LGPL')
makedepends=('git' 'mesa')
depends=('alsa-lib' 'libgl' 'glibc' 'gcc-libs')
groups=('libretro')
provides=('libretro-reicast')
conflicts=('libretro-reicast')
source=("git://github.com/libretro/reicast-emulator.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/reicast_libretro.info")

md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/reicast-emulator"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/reicast-emulator"
  make
}

package() {
  install -Dm644 "${srcdir}/reicast_libretro.info" "${pkgdir}/usr/share/libretro/reicast_libretro.info"
  install -Dm644 "${srcdir}/reicast-emulator/reicast_libretro.so" "${pkgdir}/usr/lib/libretro/reicast_libretro.so"
}
