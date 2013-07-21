# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Description from DavidPH's experimental PKGBUILD

pkgname=eternity-engine
pkgver=3.40.37
pkgrel=3
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
install=eternity-engine.install
source=(0001-findiwads_dir.patch
        http://eternity.mancubus.net/ee-$pkgver-src.zip)
sha256sums=('2903dd82de5846ceaf7644fc48014a0e99bcd4615480d06e717a5e3f091d98dc'
            'b8eede10b320f20625a6a7edb725a7bade12cb320371cfd2f0dfb28f5eb8d385')

prepare() {
  cd $startdir/src/ee-$pkgver-src
  patch -p0 -i ../0001-findiwads_dir.patch
}

build() {
  # Cannot do in-tree build.
  mkdir $startdir/src/ee-build
  cd $startdir/src/ee-build
  cmake ../ee-$pkgver-src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd $startdir/src/ee-build
  make PREFIX=/usr DESTDIR=$pkgdir install
}
