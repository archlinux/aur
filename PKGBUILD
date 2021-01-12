# Maintainer: Daniel Kutka <dano.kutka@gmail.com>

pkgname=quickddit
_pkgname=Quickddit
pkgver=1.1
pkgrel=3
pkgdesc="Unofficial reddit client"
arch=('x86_64' 'armv7' 'aarch64')
url="https://github.com/accumulator/Quickddit.git"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-quickcontrols2 qt5-webengine youtube-dl qqc2-suru-style)
makedepends=('git')
source=('git+https://github.com/dano6/Quickddit.git#branch=flavors')
md5sums=('SKIP')

prepare() {
  cd ${_pkgname}
  git submodule update --init
  
}

build() {
  cd ${_pkgname}/ubuntu-touch
  qmake-qt5 FLAVOR=qtcontrols PREFIX=/usr DEFINES+="REDDIT_CLIENT_ID=\'\\\"2AXy2YiJYhpFkA\\\"\' REDDIT_REDIRECT_URL=\'\\\"http://localhost/\\\"\' REDDIT_CLIENT_SECRET=\'\\\"\\\"\'"
  make
}

package() {
  cd ${_pkgname}/ubuntu-touch
  make INSTALL_ROOT="${pkgdir}/" install
}
