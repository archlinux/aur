# Maintainer: Viachaslau Khalikin <viachaslavic at outlook dot com>

pkgname=libretro-bk-git
pkgver=r144.fe64da4
pkgrel=1
pkgdesc="BK-0010/0011/Terak 8510a core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/bk-emulator"
license=('HPND')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
source=("${url##*/}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${url##*/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${url##*/}" -f Makefile.libretro
}

package() {
  install -Dm 644 "${url##*/}"/bk_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 "${url##*/}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ft=sh ts=2 sw=2 et:
