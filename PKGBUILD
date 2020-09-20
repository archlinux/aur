# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=solarus-run
pkgver=1.6.4
pkgrel=3
pkgdesc="A lightweight, free and open-source game engine for Action-RPGs"
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL3')
depends=('glm'
         'hicolor-icon-theme'
         'libmodplug>=0.8.8.4'
         'libvorbis'
         'luajit>=2.0'
         'openal'
         'physfs'
         'sdl2>=2.0.6'
         'sdl2_image'
         'sdl2_ttf')
makedepends=('cmake')
provides=("solarus=$pkgver")
conflicts=('solarus')
source=("https://gitlab.com/solarus-games/solarus/-/archive/v${pkgver}/solarus-v${pkgver}.tar.gz")
b2sums=('fdf9b6703af8424b4731b25b307dcc7a0966cbf89a0bf043bcfb6745d0c6e8aa1fee026f206a41ebf6c8d54b23a9a3816a6c2d7ae004c9db7c436425a94aa7d3')

prepare() {
  cd "solarus-v$pkgver"
  cmake -Wno-dev -DSOLARUS_GUI=OFF -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" .
}

build() {
  make -C "solarus-v$pkgver" ${MAKEFLAGS}
}

check() {
  make -C "solarus-v$pkgver" test
}

package() {
  make -C "solarus-v$pkgver" DESTDIR="${pkgdir}/" install
}

