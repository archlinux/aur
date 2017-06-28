# Maintainer: Cristian Porras <porrascristian@gmail.com>

pkgname=valentina
pkgver=0.5.0
pkgrel=2
pkgdesc="Cloth patternmaking software - Stable Release"
arch=('i686' 'x86_64')
url="http://valentina-project.org/"
license=('GPL3')
source=('https://bitbucket.org/dismine/valentina/get/v0.5.0.zip')
depends=('qt5-svg' 'poppler' 'qt5-xmlpatterns' )
makedepends=('qt5-tools' 'unzip' 'sed')
md5sums=('8733c30cc8e6ca18874c37b28be6eab8')

build() {
  cd "$srcdir/dismine-valentina-31c95eadca8b"
  find . -type f -print0 | xargs -0 sed -i /QForeachContainer/d
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
    	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/dismine-valentina-31c95eadca8b"
  INSTALL_ROOT="$pkgdir/" make install
}
 
