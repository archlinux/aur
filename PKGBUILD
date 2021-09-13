# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

_pkgbase=libretro-bk
pkgname=${_pkgbase}-git
pkgver=r117.70f4a2d
pkgrel=2
pkgdesc="BK-0010/0011/Terak 8510a core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/bk-emulator"
license=('custom')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install="${pkgname}".install
source=("$_pkgbase::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgbase}" -f Makefile.libretro
}

package() {
  install -Dm 644 "${_pkgbase}"/bk_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 "${_pkgbase}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ft=sh ts=2 sw=2 et:
