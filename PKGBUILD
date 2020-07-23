# Maintainer: Bogdan Drema <bogdandrema@gmail.com>

pkgname=valentina
pkgver=0.6.2alpha
pkgrel=2
pkgdesc="Sewing pattern drafting software tool, designed to remake the garment industry."
arch=('i686' 'x86_64')
url="https://valentinaproject.bitbucket.io/"
license=('GPL3')
source=('https://gitlab.com/smart-pattern/valentina/-/archive/develop/valentina-develop.zip')
depends=('qt5-svg' 'poppler' 'qt5-xmlpatterns')
makedepends=('qt5-tools' 'unzip' 'sed')
md5sums=('56310da176b813b58f1f7eb467d61985')

build() {
  cd "$srcdir/valentina-develop"
  find . -type f -print0 | xargs -0 sed -i /QForeachContainer/d
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
     	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
 	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/valentina-develop"
  INSTALL_ROOT="$pkgdir/" make install
}
