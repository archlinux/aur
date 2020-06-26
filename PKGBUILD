# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=alphaplot-git
pkgver=r1077.5e8bc859
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot git version"
url='http://alphaplot.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL2')

# make dependancies
makedepends=('boost' 'cmake' 'qt5-tools')
depends=('gsl' 'mesa' 'shared-mime-info' 'hicolor-icon-theme' 'qt5-datavis3d' 'qt5-script' 'qt5-xmlpatterns' 'qt5-svg')

# source download from git repo & prepare
source=("$pkgname::git+https://github.com/narunlifescience/AlphaPlot.git/#branch=master")
install=${pkgname}.install
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

# start building
build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make -j
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
} 
