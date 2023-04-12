# Maintainer: Donald Carr<sirspudd at gmail dot com>

# set -x

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_pkgname=artriculate
makedepends=('qt6-base' 'qt6-declarative')
pkgname=${_pkgname}-git
provides=(artriculate)
conflicts=(artriculate)
pkgver=0.7.1.r15.g201b4fb
pkgrel=2
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
source=("git+https://github.com/sirspudd/${_pkgname}")
sha256sums=('SKIP')
options=('!strip')

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule init
  git submodule update

  git fetch --tags
}

pkgver () {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  qmake6
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  INSTALL_ROOT="$pkgdir" make install
}
