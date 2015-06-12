# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pbf2osm-git
pkgver=20120318
pkgrel=1
pkgdesc="tool to convert pbf to osm"
arch=('x86_64' 'i686')
url="http://git.openstreetmap.nl/index.cgi/pbf2osm.git/"
license=('GPL')
depends=('protobuf-c' 'bzip2')
makedepends=('git')

_gitroot="http://git.openstreet.nl/pbf2osm.git"
_gitname="pbf2osm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd $_gitname
  git submodule init
  git submodule update

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd src
  make
} 

package() {
  install -Dm755 $srcdir/pbf2osm/src/pbf2osm $pkgdir/usr/bin/pbf2osm
}
