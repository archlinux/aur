# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-fabla2-git
pkgver=40d9c96
pkgrel=1
pkgdesc="Multi-purpose advanced LV2 sampler plugin"
arch=('i686' 'x86_64')
url="http://openavproductions.com/fabla2/"
license=('GPL3')
groups=('openav')
depends=('cairo' 'cairomm' 'jack2' 'libsndfile' 'lv2' 'ntk-git')
makedepends=('cmake' 'git')
optdepends=('jalv')
provides=('openav-fabla2')
_gitname="openAV-Fabla2"
source=(git://github.com/harryhaaren/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --always --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  cmake ./ -DCMAKE_INSTALL_PREFIX="/usr" -DRELEASE_BUILD=1
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}
