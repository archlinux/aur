# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-artyfx-git
pkgver=release.1.2.36.g3a8cb9a
pkgrel=1
pkgdesc="OpenAV ArtyFX LV2 plugin suite"
arch=('i686' 'x86_64')
url="http://openavproductions.com/artyfx/"
license=('GPL3')
depends=('cairo' 'cairomm' 'libsndfile' 'lv2' 'ntk-git')
makedepends=('cmake' 'git')
optdepends=('jalv')
provides=('openav-artyfx')
_gitname="openAV-ArtyFX"
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
