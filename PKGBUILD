# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
_pkgname=gambatte
pkgname=${_pkgname}-sdl-git
pkgver=r581.f8a810b
pkgrel=1
pkgdesc="A portable, open-source Game Boy Color emulator"
arch=('i686' 'x86_64')
url="https://github.com/sinamas/${_pkgname}"
license=('GPL')
depends=('gcc-libs'
         'sdl'
         'zlib')
makedepends=('git'
             'scons')
source=(git+https://github.com/sinamas/${_pkgname}.git)
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./build_sdl.sh
}

package() {
  install -D -m755 "${srcdir}/${_pkgname}/${_pkgname}_sdl/${_pkgname}_sdl" "${pkgdir}/usr/bin/${_pkgname}_sdl"
}
