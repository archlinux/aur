# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

_gitname=nxengine-libretro
_libname=nxengine_libretro
_pkgname=libretro-nxengine

pkgname=${_pkgname}-git
pkgver=r486.af3762e
pkgrel=1
pkgdesc="libretro implementation of NXEngine. (Cave Story)"
arch=('i686' 'x86_64')
url="https://github.com/libretro/${_gitname}"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=$pkgname.install
source=("git+${url}.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'e3e19e32d2456b63e5d4b3a66166622f')

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
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"

  mkdir -p "${pkgdir}/usr/share/libretro/${_libname}"
  cp -a "${_gitname}/datafiles" "${pkgdir}/usr/share/libretro/${_libname}"
}
