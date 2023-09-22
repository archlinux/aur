# Maintainer: badcast <lmecomposer@gmail.com>
_pkglib="roninengine"
_pkgbase="ronin-engine"
pkgname=${_pkgbase}-unstable-git
pkgver=1.0.0
pkgrel=3
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="RoninEngine - The Ronin Engine Framework. For World simulation, UI intersection, Game Emulation, 2D game, etc. (dev-state, unstable, alpha-version)"
arch=(x86_64)
license=('MIT')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_gfx')
optdepends=('library-brainmap: override base AI::NavMesh')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("git+${url}.git")
provides=("lib${_pkglib}.so")
conflicts=("${_pkgbase}-static-git")
md5sums=('SKIP')

build(){
   # Environment
   cd "${srcdir}/${_pkgbase}"
   build_dir="${srcdir}/build"

   # Configuring
   cmake -S . -B "${build_dir}" -DBUILD_SHARED_LIBS=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

   # Build shared lib
   cmake --build "${build_dir}"
}

package(){
   # Environment
   cd "${pkgdir}"
   build_dir="${srcdir}/build"

   DESTDIR="${pkgdir}" cmake --install "${build_dir}"

   install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/RoninEngine/LICENSE"
}
