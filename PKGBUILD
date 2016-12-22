# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=raul-git
pkgver=f8bf77d
pkgrel=1
pkgdesc="Realtime Audio Utility Library aimed at audio and musical applications"
arch=(any)
url="http://drobilla.net/software/raul/"
license=('GPL3')
depends=()
makedepends=('git' 'python')
provides=('raul')
conflicts=('raul')
_gitname="raul"
source=(git+http://git.drobilla.net/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags --always | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${_gitname}
  python waf configure --prefix="/usr"
  python waf build ${MAKEFLAGS}
}

package() {
  cd ${_gitname}
  python waf install --destdir=${pkgdir}
}
