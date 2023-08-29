# Maintainer:  VirtualTam  <virtualtam@flibidi.net>
# Contributor: Uwe Koloska <kolewu@koloro.de>
pkgname=minetestmapper-git
pkgver=20220221.5.ge14f27f
pkgrel=1
pkgdesc="Minetest map generator"
arch=('armv7h' 'i686' 'x86_64')
url="https://wiki.minetest.net/Minetestmapper"
license=('LGPL')
depends=('gd' 'leveldb' 'postgresql-libs' 'sqlite')
makedepends=('cmake' 'git')
provides=('minetestmapper')
_gitname="minetestmapper"
source=(git+https://github.com/minetest/minetestmapper.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always --tags | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  cmake . -DENABLE_LEVELDB=1 -DCMAKE_INSTALL_PREFIX="/usr/" -DCUSTOM_SHAREDIR="/usr/share/${_gitname}"
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
}
