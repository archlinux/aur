# Maintainer:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

_pkgname="libretro-nestopia"
pkgname="$_pkgname-git"
pkgver=r109.3dcbec4
pkgrel=1
pkgdesc='Nintendo Entertainment System core'
url='https://github.com/libretro/nestopia'
license=('GPL2')
arch=('i686' 'x86_64')

depends=(
  'libretro-core-info'
)
makedepends=(
  'git'
)

_pkgver="${pkgver#r}"
provides=("$_pkgname=${_pkgver%.*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgsrc/libretro"
  make
}

package() {
  cd "$_pkgsrc/libretro"
  install -Dm644 nestopia_libretro.so -t "${pkgdir:?}/usr/lib/libretro/"
}
