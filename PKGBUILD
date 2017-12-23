# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

_gitname=nxengine-libretro
_libname=nxengine_libretro
_pkgname=libretro-nxengine

pkgname=${_pkgname}-git
pkgver=r501.f3050ba
pkgrel=1
pkgdesc="libretro implementation of NXEngine. (Cave Story)"
arch=('x86_64')
url="https://github.com/libretro/${_gitname}"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=$pkgname.install
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"

  mkdir -p "${pkgdir}/usr/share/libretro/${_libname}"
  cp -a "${_gitname}/datafiles" "${pkgdir}/usr/share/libretro/${_libname}"
}
