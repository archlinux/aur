# Contributor:  Swift Geek
# Maintainer: wcasanova wcasanova at disroot dot org

pkgname=seamly2d-git
_pkgname=Seamly2D
pkgver=v0.6.0.1.r355.g9af57415f
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/FashionFreedom/Seamly2D.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  [ ! -e build ] && mkdir build
  cd build
  export QT_SELECT=5
  qmake PREFIX=/usr/ PREFIX_LIB=/usr/lib/ ../Seamly2D.pro -r \
  CONFIG+=noDebugSymbols CONFIG+=no_ccache CONFIG+=noTests CONFIG+=noRunPath
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  INSTALL_ROOT="$pkgdir/" make install
}
