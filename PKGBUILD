# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=solarus
pkgver=1.6.4
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
         'sdl2>=2.0.6'
         'sdl2_image'
         'sdl2_ttf')
makedepends=('cmake')
conflicts=('solarus-git' 'solarus-run')
source=("https://gitlab.com/solarus-games/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('fdf9b6703af8424b4731b25b307dcc7a0966cbf89a0bf043bcfb6745d0c6e8aa1fee026f206a41ebf6c8d54b23a9a3816a6c2d7ae004c9db7c436425a94aa7d3')

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
