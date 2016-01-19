#
# SimGrid: Grid and Cloud Simulator
#
# Maintainer: Guillaume Turchini <guillaume.turchini@gmail.com>"

_pkgname=simgrid
pkgname=${_pkgname}-java-git
pkgver=r18902.33e9033
pkgrel=1
pkgdesc='Grid and Cloud Simulator (with java)'
arch=('any')
url='http://simgrid.gforge.inria.fr/index.html'
license=('GPL')
source=("${_pkgname}::git+https://github.com/mquinson/simgrid.git")
depends=('boost-libs' 'java-runtime')
makedepends=('cmake' 'git' 'boost' 'java-environment')
md5sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}/
  cmake -Denable_documentation=OFF -Denable_java=ON -DJAVA_HOME=/usr/lib/jvm/default .
  make simgrid-java_jar
}

package() {
  cd $srcdir/${_pkgname}/
  install -Dm 755 simgrid.jar "$pkgdir/opt/simgrid/simgrid.jar"
}

