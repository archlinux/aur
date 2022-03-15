# Contributor: Benjamin Hodgetts <ben@xnode.org>
# Contributor: BrainDamage
pkgname=libretro-reicast-oit-git
pkgver=r2771.f0be7401
pkgrel=1
pkgdesc="libretro implementation of Reicast Sega Dreamcast Emulator (OIT version)"
arch=(any)
url="https://github.com/libretro/reicast-emulator"
license=(GPL2 LGPL)
makedepends=(git mesa)
depends=(alsa-lib libgl glibc gcc-libs)
provides=(libretro-reicast)
conflicts=(libretro-reicast)
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd reicast-emulator
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd reicast-emulator
  make HAVE_OIT=1
}

package() {
  install -Dm644 "${srcdir}/reicast-emulator/reicast_oit_libretro.so" "${pkgdir}/usr/lib/libretro/reicast_oit_libretro.so"
}
