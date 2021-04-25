# Maintainer: Simon K <simon@airgproducts.com>
# Contributor: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5-svn
pkgver=6.48
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://www.xflr5.com/xflr5.htm"
license=('GPL')
depends=('qt5-base')
makedepends=('unzip' 'subversion')
source=("svn+https://svn.code.sf.net/p/xflr5/code/tags/v${pkgver}/xflr5")
sha256sums=('SKIP')

build() {
  cd "$srcdir/xflr5"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
  cd "$srcdir/xflr5"

  make INSTALL_ROOT="$pkgdir" install

  sed -i 's/usr\/local/usr/g' $pkgdir/usr/share/xflr5/xflr5.desktop
  mkdir -p $pkgdir/usr/share/applications
  mv $pkgdir/usr/share/xflr5/xflr5.desktop $pkgdir/usr/share/applications/
}


