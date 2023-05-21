# Maintainer: badcast <lmecomposer@gmail.com>

_pkgbase="ronin-engine"
pkgname=${_pkgbase}-unstable-git
pkgver=0.0
pkgrel=0
url="https://github.com/badcast/ronin-engine"
pkgdesc="RGE - RoninGameEngine minimal game-world simulator (dev-state, unstable, alpha-version)"
arch=(x86_64 i686)
license=('GPL3')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake' 'gcc' 'make')
source=("git+${url}.git")
md5sums=('SKIP')

build(){
   cd "${srcdir}/${_pkgbase}"
   cmake -DCMAKE_BUILD_TYPE=Release -B ./build
   cmake --build ./build -j $(nproc)
}

package(){
   mkdir -p "${pkgdir}/usr/include/"
   cp --recursive "${srcdir}/${_pkgbase}/include/ronin" "${pkgdir}/usr/include/"
   find "${pkgdir}/usr/include/" -type d -exec chmod 755 {} \;
   find "${pkgdir}/usr/include/" -type f -exec chmod 644 {} \;
   install -Dm644 "${srcdir}/${_pkgbase}/build/libbadrge.so" -t "${pkgdir}/usr/lib/"
}
