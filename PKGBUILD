# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.42
pkgrel=2
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://www.xflr5.com/xflr5.htm"
license=('GPL')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/project/xflr5/${pkgver}/xflr5_${pkgver}_src.tar.gz")
sha256sums=('8abee3dfc68391bd802481815727fc88d2a5920834aa9789e259ecace87fdb43')

prepare() {
  cd "$srcdir/$pkgname"

  sed -i s_/usr/local/lib_/usr/lib_g xflr5-engine/xflr5-engine.pro 
  sed -i s_/usr/local/lib_/usr/lib_g XFoil-lib/XFoil-lib.pro
}

build() {
  cd "$srcdir/$pkgname"
  
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make INSTALL_ROOT="$pkgdir" install
}

