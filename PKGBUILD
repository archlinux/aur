pkgname=ktikz
pkgver=0.12
pkgrel=2
pkgdesc="A small application helping you to create TikZ diagrams (from the LaTeX pgf package)"
arch=('i686' 'x86_64')
url="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/"
license=('GPL')
depends=('poppler-qt5' 'kdebase-runtime')
makedepends=('cmake' 'docbook-xml' 'qt5-tools')
source=("https://github.com/fhackenberger/ktikz/archive/$pkgver.tar.gz")
md5sums=('3834a2c0c7d135eb7f958053a56c07ca')

build() {
  cd $pkgname-$pkgver
  mkdir -p buildqt
  cd buildqt
  qmake ../qtikz.pro
  make
}

package() {
  cd $pkgname-$pkgver
  cd buildqt
  make INSTALL_ROOT="$pkgdir" install
  cd $pkgdir/usr/bin
  ln -sf qtikz ktikz
}

