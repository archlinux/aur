# Maintainer: Bogdan Drema <bogdandrema@gmail.com>

pkgname=valentina
pkgver=0.5.0
pkgrel=3
pkgdesc="Sewing pattern drafting software tool, designed to remake the garment industry."
arch=('i686' 'x86_64')
url="https://valentinaproject.bitbucket.io/"
license=('GPL3')
source=('https://bitbucket.org/dismine/valentina/get/43c4c44d4c90.zip')
depends=('qt5-svg' 'poppler' 'qt5-xmlpatterns')
makedepends=('qt5-tools' 'unzip' 'sed')
md5sums=('ba8d31564f00c9ca90ebe10966dae5f1')

build() {
  cd "$srcdir/dismine-valentina-43c4c44d4c90"
  find . -type f -print0 | xargs -0 sed -i /QForeachContainer/d
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
     	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
 	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/dismine-valentina-43c4c44d4c90"
  INSTALL_ROOT="$pkgdir/" make install
}