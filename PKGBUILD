# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=lander-git
_pkgname=lander
pkgver=r361.c258aa1
pkgrel=1
pkgdesc="Lunar Lander clone using OpenGL (git)"
url="https://github.com/nickg/lander"
depends=('sdl2_mixer' 'glew' 'sdl2_image' 'freetype2')
makedepends=('git' 'gendesk' 'meson' 'ninja')
conflicts=(lander lander-curses-git)
license=('GPL3')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/nickg/lander.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  if [ -d build ]
  then
    rm -rf build
  fi
  mkdir build
  cd build
  meson .. --prefix=/usr
  ninja 
}

package() {
  cd ${srcdir}/${pkgname}/build
  DESTDIR="${pkgdir}" ninja install
}

# vim:set ts=2 sw=2 et:
