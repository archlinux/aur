pkgname=osm-binary
pkgver=20150623
pkgrel=1
pkgdesc="osm pbf format"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL')
depends=('protobuf')
makedepends=('git')
_gitroot="https://github.com/scrosby/OSM-binary.git"
_gitname="OSM-binary"

build(){
  cd $srcdir
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git reset --hard
    git clean -dxf
    git pull 
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  cd ./src
  make
}

package() {
  cd "$srcdir/$_gitname/src"
  make install DESTDIR="$pkgdir"
} 

