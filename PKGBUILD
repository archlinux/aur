# Maintainer: Cristian Porras <porrascristian@gmail.com>

pkgname=valentina
pkgver=0.4.5
pkgrel=1
pkgdesc="Cloth patternmaking software - Stable Release"
arch=('i686' 'x86_64')
url="http://valentina-project.org/"
license=('GPL3')
source=('https://bitbucket.org/dismine/valentina/get/v0.4.5.zip')
depends=('qt5-svg')
makedepends=('qt5-tools' 'unzip' 'awk')
md5sums=('49d3c7db3526e3cb84dffdf705d613f2')

build() {
  cd "$srcdir/dismine-valentina-b6e0a13808df"
  awk 'NR==213 {$0="while ( m_strFormula.data()[m_iPos] > QChar(0) && m_strFormula.data()[m_iPos] <= QChar(0x20) )"} { print }' src/libs/qmuparser/qmuparsertokenreader.cpp > src/libs/qmuparser/qmuparsertokenreader_temp.cpp
  mv src/libs/qmuparser/qmuparsertokenreader_temp.cpp src/libs/qmuparser/qmuparsertokenreader.cpp
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
    	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/dismine-valentina-b6e0a13808df"
  INSTALL_ROOT="$pkgdir/" make install
}
 
