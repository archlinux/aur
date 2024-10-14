# Contributor: Swift Geek
# Maintainer: AI5C <ai5c@ai5c.com>

pkgname=seamly2d
_pkgname=Seamly2D
pkgver=2024.10.8.1758
pkgrel=1
pkgdesc="Open source patternmaking software"
arch=('i686' 'x86_64')
url="https://seamly.net/"
license=('GPL3')
depends=('qt5-svg' 'qt5-xmlpatterns' 'desktop-file-utils')
source=("https://github.com/FashionFreedom/Seamly2D/archive/v$pkgver.tar.gz")

sha512sums=('bcdc91c0454a6640f163961103bceb4b0cf0f6de99183b2e623a04223a4a54d501428f04ed37241f2db0a582a461f256943477e745923681bc54e6fa014a5b8c')

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
