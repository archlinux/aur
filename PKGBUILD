# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-fabla-git
pkgver=release.1.3.1.3.gcfbd4b3
pkgrel=1
pkgdesc="A sampler LV2 plugin called Fabla"
arch=('i686' 'x86_64')
url="http://openavproductions.com/fabla/"
license=('GPL3')
depends=('cairo' 'cairomm' 'jack2' 'libsndfile' 'lv2' 'ntk-git')
makedepends=('git')
provides=('openav-fabla')
_gitname="openAV-Fabla"
source=(git://github.com/harryhaaren/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  cmake ./ -DCMAKE_INSTALL_PREFIX="/usr" -DRELEASE_BUILD=1
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}
