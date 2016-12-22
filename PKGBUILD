# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=machina-git
pkgver=a929010
pkgrel=1
pkgdesc=""
arch=('x86' 'x86_64')
url="http://drobilla.net/software/machina/"
license=('GPL3')
depends=('ganv-git' 'jack2' 'sord')
makedepends=('git' 'python' 'raul-git')
provides=('machina')
_gitname="machina"
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
