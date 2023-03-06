# Contributor: Swift Geek
# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=seamly2d
_pkgname=Seamly2D
pkgver=2023.3.6.1639
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net/"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
source=("https://github.com/FashionFreedom/Seamly2D/archive/v$pkgver.tar.gz")

sha512sums=('ffae879b6f332635b560e8e6d1a5dc6688ac17efdd930a7710c7f1924f0e9b58cd1093fa7c074c6d1d2f4d19bc30ae3510ebb6e8bc59c4a031fabafeeaf4eb49')

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
