# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=ganv-git
pkgver=e7731e9
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/ganv/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('git' 'python')
provides=('ganv')
conflicts=('ganv')
_gitname="ganv"
source=(git+http://git.drobilla.net/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags --always | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${_gitname}
  CXXFLAGS+=' -std=c++11'
  python waf configure --prefix="/usr"
  python waf build ${MAKEFLAGS}
}

package() {
  cd ${_gitname}
  python waf install --destdir=${pkgdir}
}
