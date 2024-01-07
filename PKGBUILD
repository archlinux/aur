# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

## useful links
# http://alphaplot.sourceforge.net/
# https://github.com/narunlifescience/AlphaPlot

_pkgname="alphaplot"
pkgname="$_pkgname-git"
pkgver=1.02.r19.gda97d1fa
pkgrel=2
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
url="https://github.com/narunlifescience/AlphaPlot"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')

depends=(
  'gsl'
  'hicolor-icon-theme'
  'qt5-datavis3d'
  'qt5-script'
  'qt5-svg'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'glu'
  'qt5-tools'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  "$_pkgname"
  'alphaplot-bin'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  # Note: PREFIX is not used
  qmake
  make
}

package() {
  cd "$_pkgsrc"
  # Note: DESTDIR is ignored
  make INSTALL_ROOT="${pkgdir}" install
}
