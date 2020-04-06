# Maintainer: Bogdan Drema <bogdandrema@gmail.com>

pkgname=valentina
pkgver=0.6.2alpha
pkgrel=1
pkgdesc="Sewing pattern drafting software tool, designed to remake the garment industry."
arch=('i686' 'x86_64')
url="https://valentinaproject.bitbucket.io/"
license=('GPL3')
source=('https://bitbucket.org/dismine/valentina/get/develop.zip')
depends=('qt5-svg' 'poppler' 'qt5-xmlpatterns')
makedepends=('qt5-tools' 'unzip' 'sed')
md5sums=('4ccad700fada6f64c8da78f7092e8be5')

build() {
  cd "$srcdir/dismine-valentina-c8ade523093a"
  find . -type f -print0 | xargs -0 sed -i /QForeachContainer/d
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
     	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
 	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/dismine-valentina-c8ade523093a"
  INSTALL_ROOT="$pkgdir/" make install
}
