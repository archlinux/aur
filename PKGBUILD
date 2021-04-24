# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=solarus-run
pkgver=1.6.5
pkgrel=4
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
b2sums=('96a67c7210c70d23d3fa08e24ee2c4cfbeb6e95dce7236ab860695bf4fc57aaa5d54b02e25ad2f10dfc498cc836bf83753d99cbeca1ff7bf496f7d589accbbf5')

prepare() {
  cd "solarus-v$pkgver"
  mkdir build && cd build
  cmake -Wno-dev -DSOLARUS_GUI=OFF -DCMAKE_INSTALL_PREFIX="/usr" ..
}

build() {
  make -C "solarus-v$pkgver/build"
}

check() {
  make -C "solarus-v$pkgver/build" test
}

package() {
  make -C "solarus-v$pkgver/build" DESTDIR="${pkgdir}/" install
}

