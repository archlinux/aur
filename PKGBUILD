# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
pkgname=solarus
pkgver=1.4.2
pkgrel=2
epoch=
pkgdesc="An open-source Zelda-like 2D game engine used by the games zsxd and zsdx."
arch=('i686' 'x86_64')
url="http://www.solarus-engine.org/"
license=('GPL')
groups=()
depends=('luajit' 'sdl2_image' 'sdl2_ttf' 'physfs' 'openal' 'libvorbis' 'libmodplug')
makedepends=('cmake' 'zip')
checkdepends=()
optdepends=('zsxd' 'zsdx')
provides=('solarus-engine')
conflicts=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
replaces=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
backup=()
options=()
install=
changelog=
source=(http://www.zelda-solarus.com/downloads/$pkgname/$pkgname-$pkgver-src.tar.gz)
noextract=()
md5sums=('305ac13dc2c32d35a9effd4e4ed2b2b0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  #fix wrong version number of 1.4.2 source
  sed -i 's/SOLARUS_MINOR_VERSION 5/SOLARUS_MINOR_VERSION 4/' include/solarus/Common.h
  sed -i 's/SOLARUS_PATCH_VERSION 0/SOLARUS_PATCH_VERSION 2/' include/solarus/Common.h
  
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release -D DEFAULT_QUEST=/usr/share/solarus/zsdx .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

