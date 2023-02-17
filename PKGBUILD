# Contributor: Swift Geek
# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=seamly2d
_pkgname=Seamly2D
pkgver=2023.2.13.238
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net/"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
source=("https://github.com/FashionFreedom/Seamly2D/archive/v$pkgver.tar.gz")

sha512sums=('83e8e006078949ec3c378e06d4655d8c6c330c8c8a144fefec36f1557b87584a59916c2abee910c4cc8ee0f7d5b04450749b0e9566d8f3ee37198705ee6e0bc1')

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
