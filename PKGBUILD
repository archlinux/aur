# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=cirkuit
pkgver=0.4.3
pkgrel=5
pkgdesc="Cirkuit is a KDE4 GUI for the Circuit macros by Dwight Aplevich, for drawing high-quality line diagrams to include in TeX, LaTeX, for similar documents."
url="https://wwwu.uni-klu.ac.at/magostin/cirkuit.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=('poppler-qt5' 'm4' 'ghostscript' 'texlive-pstricks' 'netpbm' 'knewstuff' 'ktexteditor' 'kdelibs4support' 'hicolor-icon-theme' 'kdoctools')
optdepends=('dpic: improved circuit macros support' 'gnuplot: Gnuplot backend')
makedepends=('texlive-core' 'cmake' 'extra-cmake-modules' 'kdesignerplugin')
source=(https://wwwu.uni-klu.ac.at/magostin/src/$pkgname-$pkgver.tar.bz2)
sha512sums=('880033a7f52142d474840a4d095f89f37a2181f452712bde121646850fe3954f2851fd6dfdcfdfd2ce7b0b8d630522343678e6c5d1b67cddde73b24b86c9e6a5')

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
