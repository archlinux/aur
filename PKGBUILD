# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Description from DavidPH's experimental PKGBUILD

pkgname=eternity-engine-git
_pkgname=${pkgname/-git/}
pkgver=3.40.46.27.gd6a6623
pkgrel=3
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('git' 'cmake')
conflicts=(${_pkgname})
source=(${_pkgname}::git+https://github.com/team-eternity/eternity.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local version=$(git describe --tags)
  local version=${version//-/.}
  echo $version
}

build() {
  # Cannot do in-tree build.
  mkdir $startdir/src/ee-build
  cd $startdir/src/ee-build
  cmake ../$_pkgname -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $startdir/src/ee-build
  make PREFIX=/usr DESTDIR=$pkgdir install
}
