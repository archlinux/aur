# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=solarus
pkgver=1.6.5
pkgrel=1
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
         'qt5-base'
         'qt5-tools'
         'sdl2>=2.0.6'
         'sdl2_image'
         'sdl2_ttf')
makedepends=('cmake')
conflicts=('solarus-git' 'solarus-run')
source=("https://gitlab.com/solarus-games/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('96a67c7210c70d23d3fa08e24ee2c4cfbeb6e95dce7236ab860695bf4fc57aaa5d54b02e25ad2f10dfc498cc836bf83753d99cbeca1ff7bf496f7d589accbbf5')

prepare() {
  cd "$pkgname-v$pkgver"
  cmake -Wno-dev -DSOLARUS_TESTS=OFF -DCMAKE_INSTALL_PREFIX="/usr"  -DCMAKE_BUILD_TYPE=Release .
}

build() {
  make -C "$pkgname-v$pkgver" ${MAKEFLAGS}
}

package() {
  make -C "$pkgname-v$pkgver" DESTDIR="${pkgdir}/" install
}
