# Maintainer: Viachaslau Khalikin <viachaslavic at outlook dot com>
# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive <almostalive2003 at gmail dot com>

pkgname=libretro-fceumm-git
pkgver=r1783.0d610d9
pkgrel=1
pkgdesc="libretro implementation of FCEUmm. (Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-fceumm"
license=('GPL-2.0-or-later')
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
  make -C "${url##*/}"
}

package() {
  install -Dm 644 "${url##*/}"/fceumm_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim:set ft=sh ts=2 sw=2 et:
