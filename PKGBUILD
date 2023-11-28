# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=alphaplot-git
pkgver=1.02.r19.gda97d1fa
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot git version"
url='http://alphaplot.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL2')

# make dependancies
makedepends=('boost' 'cmake' 'qt5-tools' 'glu')
depends=('gsl' 'hicolor-icon-theme' 'qt5-datavis3d' 'qt5-script' 'qt5-svg')

# source download from git repo & prepare
source=("$pkgname::git+https://github.com/narunlifescience/AlphaPlot.git")
sha256sums=('SKIP')
provides=('alphaplot')
conflicts=('alphaplot')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

# start building
build() {
  cd "$pkgname"
  qmake
  make
}

# prepare package
package() {
  cd "$pkgname"
  make INSTALL_ROOT="${pkgdir}" install
}
