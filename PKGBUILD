# Maintainer: badcast <lmecomposer@gmail.com>
_pkglib="roninengine"
_pkgbase="ronin-engine"
pkgname=${_pkgbase}-static-git
pkgver=1.0.0
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="RoninEngine (static) - The Ronin Engine Framework. For World simulation, UI intersection, Game Emulation, 2D game, etc. (dev-state, unstable, alpha-version)"
arch=(x86_64 i686)
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_gfx')
optdepends=('libacross: override base AI::NavMesh')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("git+${url}.git")
provides=("lib${_pkglib}.a")
conflicts=("${_pkgbase}-unstable-git")
md5sums=('SKIP')
options=(staticlibs strip)

build(){
   # Environment
   cd "${srcdir}/${_pkgbase}"
   build_dir="${srcdir}/build"

   # Configuring
   cmake -S . -B "${build_dir}" -DCMAKE_CXX_FLAGS="-static -fPIC" -DBUILD_SHARED_LIBS=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

   # Build static lib
   cmake --build "${build_dir}"
}

package(){
   # Environment
   cd "${srcdir}/${_pkgbase}"
   build_dir="${srcdir}/build"

   DESTDIR="${pkgdir}" cmake --install "${build_dir}"
}
