# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-artyfx-git
pkgver=1.2.r36.g3a8cb9a
pkgrel=3
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
source=(git://github.com/harryhaaren/${_gitname}.git)
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
