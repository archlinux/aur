# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=alphaplot-git
pkgver=r1244.da97d1f
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot git version"
url='http://alphaplot.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL2')

# make dependancies
makedepends=('boost' 'cmake' 'qt5-tools' 'glu')
depends=('gsl' 'hicolor-icon-theme' 'qt5-datavis3d' 'qt5-script' 'qt5-svg')

# source download from git repo & prepare
source=("$pkgname::git+https://github.com/narunlifescience/AlphaPlot.git/#branch=master")
install=${pkgname}.install
sha512sums=('SKIP')
provides=('alphaplot')
conflicts=('alphaplot')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# start building
build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make
}

# prepare package
package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
