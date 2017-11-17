# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-fabla2-git
pkgver=r497.0b019f0
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
  # git describe --long --always --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'

  # AUR VCS guideline for untagged repositories
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
