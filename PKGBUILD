# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>
# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

_pkgbase=libretro-freeintv
pkgname=${_pkgbase}-git
pkgver=r203.0058a09
pkgrel=1
pkgdesc="A libretro emulation core for the Mattel Intellivision designed to be compatible with joypads from the SNES era forward"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FreeIntv"
license=('GPL' 'custom:zlib')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
install="${pkgname}".install
source=("$_pkgbase::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgbase}"
}

package() {
  install -Dm 644 "${_pkgbase}"/freeintv_libretro.so  -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 "${_pkgbase}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ft=sh ts=2 sw=2 et:
