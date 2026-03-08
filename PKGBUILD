# Maintainer: azerty-xmpp forked by the original libretro-quicknes-git

pkgname=libretro-quicknes-azerty-git
pkgver=r419.e732387
pkgrel=1
pkgdesc="libretro implementation of QuickNES Core (NES)"
groups=('libretro')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/libretro/QuickNES_Core"
license=('GPL')
provides=('libretro-quicknes')
conflicts=('libretro-quicknes' 'libretro-quicknes-git')
depends=('glibc' 'zlib')
makedepends=('git')

_gitname=QuickNES_Core
_libname=quicknes_libretro

source=("${pkgname}::git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  
  export CFLAGS="$CFLAGS -O3 -pipe -flto"
  export CXXFLAGS="$CXXFLAGS -O3 -pipe -flto"
  export LDFLAGS="$LDFLAGS -flto"

  make
}

package() {
  cd "${pkgname}"
  
  install -Dm644 "${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
