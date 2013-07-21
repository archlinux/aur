# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Description from DavidPH's experimental PKGBUILD

pkgname=eternity-engine
pkgver=3.40.37
pkgrel=2
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
install=eternity-engine.install
source=(http://eternity.mancubus.net/ee-$pkgver-src.zip)
sha256sums=('b8eede10b320f20625a6a7edb725a7bade12cb320371cfd2f0dfb28f5eb8d385')

build() {
  # Cannot do in-tree build.
  mkdir $startdir/src/ee-build
  cd $startdir/src/ee-build
  cmake ../ee-$pkgver-src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make
}

package() {
  cd $startdir/src/ee-build
  make PREFIX=/usr DESTDIR=$pkgdir install
}
