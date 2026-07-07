# Maintainer: Viachaslau Khalikin <viachaslavic at outlook dot com>
# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=libretro-freeintv-git
pkgver=r247.428915b
pkgrel=1
pkgdesc="A libretro emulation core for the Mattel Intellivision designed to be compatible with joypads from the SNES era forward"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FreeIntv"
license=('GPL-2.0-or-later' 'Zlib')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
source=("${url##*/}::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${url##*/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${url##*/}"
}

package() {
  install -Dm 644 "${url##*/}"/freeintv_libretro.so  -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 "${url##*/}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ft=sh ts=2 sw=2 et:
