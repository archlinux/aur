# Maintainer: prg <prg-archlinux _at_ xannode _dot com>

pkgname=fceux-git
pkgver=2.3.0.17.gc6752c41
pkgrel=2
pkgdesc="Fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support"
arch=('i686' 'x86_64')
url="http://fceux.com/"
license=('GPL')
depends=('sdl2' 'lua51' 'qt5-base' 'minizip')
makedepends=('git' 'cmake' 'make' 'pkgconf' 'mesa-libgl' 'glu')
optdepends=('xchm: for viewing the help manual')
provides=('fceux')
conflicts=('fceux')
source=(git+https://github.com/TASVideos/fceux.git)
md5sums=('SKIP')

pkgver() {
  cd fceux
  git describe --tags --always | sed 's/-/./g' | sed 's/fceux.//'
}


build() {
  cd fceux
  mkdir -p build
  cd build
  cmake  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -fPIC -w" \
       ..
  make
}

package() {
  cd fceux
  DESTDIR="$pkgdir" make -C build install
}
