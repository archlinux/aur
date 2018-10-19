# Maintainer: Swift Geek

pkgname=seamly2d
_pkgname=Seamly2D
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net/"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
source=("https://github.com/FashionFreedom/Seamly2D/archive/v$pkgver.tar.gz")
md5sums=('f315ef83cc462d89395af03c0528dc2c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  [ ! -e build ] && mkdir build
  cd build
  export QT_SELECT=5
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib ../Seamly2D.pro -r \
    CONFIG+=noDebugSymbols CONFIG+=no_ccache CONFIG+=noTests CONFIG+=noRunPath
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  INSTALL_ROOT="$pkgdir/" make install
}
