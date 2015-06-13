# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=cirkuit
pkgver=0.4.3
pkgrel=4
pkgdesc="Cirkuit is a KDE4 GUI for the Circuit macros by Dwight Aplevich, for drawing high-quality line diagrams to include in TeX, LaTeX, for similar documents."
url="http://wwwu.uni-klu.ac.at/magostin/cirkuit.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'texlive-core' 'm4' 'ghostscript' 'texlive-pstricks' 'netpbm' 'poppler-qt')
makedepends=('cmake' 'automoc4')
optdepends=('dpic: improved circuit macros support' 'gnuplot: Gnuplot backend')
source=(http://wwwu.uni-klu.ac.at/magostin/src/$pkgname-$pkgver.tar.bz2)
md5sums=('dccdb6bdb6f1afb99cbebe4780f96b49')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -rf build
  mkdir  build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4
  make clean 
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/apps/katepart/syntax/gnuplot.xml
}