# Contributor:  Swift Geek
# Maintainer: wcasanova wcasanova@disroot.org

pkgname=seamly2d-git
_pkgname=Seamly2D
pkgver=weekly.20201221.r0.g9af57415f
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/FashionFreedom/Seamly2D.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
