# Maintainer:  Voryzen Fire <piro.travesura@gmail.com>
# Previous Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-artyfx-git
pkgver=1.3.1.r0.g9b147f2
pkgrel=5
pkgdesc="OpenAV ArtyFX LV2 plugin suite"
arch=('i686' 'x86_64')
url="http://openavproductions.com/artyfx/"
license=('GPL3')
groups=('openav')
depends=('cairo' 'cairomm' 'libsndfile' 'lv2' 'ntk-git')
makedepends=('cmake' 'git')
optdepends=('jalv')
provides=('openav-artyfx')
_gitname="openAV-ArtyFX"
source=(git+https://github.com/openAVproductions/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
