# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Description from DavidPH's experimental PKGBUILD

pkgname=eternity-engine
pkgver=3.40.46
pkgrel=2
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
source=(http://eternity.mancubus.net/ee-$pkgver-src.zip)
sha256sums=('27c49450fb814c4d9c81e5f2895cbd825f9c7a9f3d024e824ed6feb70ef6965c')

build() {
  # Cannot do in-tree build.
  mkdir $startdir/src/ee-build
  cd $startdir/src/ee-build
  cmake ../ee-$pkgver-src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $startdir/src/ee-build
  make PREFIX=/usr DESTDIR=$pkgdir install
}
