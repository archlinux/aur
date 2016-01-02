# Maintainer: Ashley Towns <mail {at} ashleytowns {dot} id {dot} au>

pkgname=swen
pkgver=28.91c5b6b
pkgrel=1
pkgdesc="A toy 2d game engine written in swift using SDL2"
arch=('any')
url="https://github.com/aktowns/${pkgname}"
license=('apache')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_net' 'sdl2_ttf' 'sdl2_mixer' 'chipmunk' 'libxml2')
makedepends=('git')
source=(${pkgname}::"git+https://github.com/aktowns/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  swift build
}

package() {
  # make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/${pkgname}/.build/debug/SwenDemo" "${pkgdir}/usr/bin"
}

