# Contributor: Arun Narayanankutty <n.arun.lifescience@gmail.com>

pkgname=alphaplot
pkgver=0.01
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
arch=('i686' 'x86_64')
license=('GPL-2')

# make dependancies
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qwt5' 'qwtplot3d')

# source download from git repo & prepare
source=(git+https://github.com/narunlifescience/alphaplot.git)
install=${pkgname}.install
sha256sums=('SKIP')
prepare() {
  cd "${srcdir}"
}

# start building
build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt4
  make
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"
} 
