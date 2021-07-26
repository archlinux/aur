# Maintainer: quellen <lodgerz@gmail.com>
# Contributor: Daniel Menelkir <menelkir@itroll.org>

pkgname=libretro-vice-git
pkgver=20803.a16b0b83d
pkgrel=1
pkgdesc="A port of the Commodore 8bit Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/vice-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'libretro-core-info')
makedepends=('git')

_gitname=vice-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make EMUTYPE=x128
  make EMUTYPE=x64
  make EMUTYPE=x64dtv
  make EMUTYPE=x64sc
  make EMUTYPE=xcbm2
  make EMUTYPE=xcbm5x0
  make EMUTYPE=xpet
  make EMUTYPE=xplus4
  make EMUTYPE=xscpu64
  make EMUTYPE=xvic
}

package() {
        install -Dm644 "${_gitname}/vice_x128_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x128_libretro.so"
        install -Dm644 "${_gitname}/vice_x64_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x64_libretro.so"
        install -Dm644 "${_gitname}/vice_x64dtv_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x64dtv_libretro.so"
        install -Dm644 "${_gitname}/vice_x64sc_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x64sc_libretro.so"
        install -Dm644 "${_gitname}/vice_xcbm2_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xcbm2_libretro.so"
        install -Dm644 "${_gitname}/vice_xcbm5x0_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xcbm5x0_libretro.so"
        install -Dm644 "${_gitname}/vice_xpet_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xpet_libretro.so"
        install -Dm644 "${_gitname}/vice_xplus4_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xplus4_libretro.so"
        install -Dm644 "${_gitname}/vice_xscpu64_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xscpu64_libretro.so"
        install -Dm644 "${_gitname}/vice_xvic_libretro.so" "${pkgdir}/usr/lib/libretro/vice_xvic_libretro.so"
}
