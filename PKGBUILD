pkgname=libretro-kronos-git
pkgver=r5728.2995a5f9
pkgrel=1
pkgdesc='Sega Saturn core'
arch=('i686' 'x86_64')
url='https://github.com/FCare/Kronos'
license=('GPL2')
groups=('libretro-unstable')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-kronos')
conflicts=('libretro-kronos')
source=('Kronos::git+https://github.com/FCare/Kronos.git'
        'fix-build.patch')
sha256sums=('SKIP'
            '8546b631386cfe7027dff302c95d59689c1129b78d68e40aac2a3d704da8b830')

pkgver() {
  cd Kronos

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd Kronos/yabause/src/libretro
  # fix make: *** No rule to make target '../musashi/m68kops.c.o', needed by 'kronos_libretro.so'.  Stop.
  patch -p1 -i ${srcdir}/fix-build.patch
}

build() {
  cd Kronos/yabause/src/libretro

  make
}

package() {
  cd Kronos/yabause/src/libretro

  install -Dm 644 kronos_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
