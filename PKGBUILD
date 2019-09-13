# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

_pkgname=qbs
pkgname=${_pkgname}-git
pkgver=v1.7.2.r297.g512704a5
pkgrel=1
pkgdesc='Qt Build Suite: Build tool that helps simplify the build process for developing projects across multiple platforms.'
arch=('x86_64' 'i686')
url='https://wiki.qt.io/Qt_Build_Suite'
license=('LGPL')
provides=('qbs')
conflicts=('qtcreator' 'qbs')
depends=('qt5-base' 'qt5-script')
makedepends=('gcc' 'git')
source=("git://code.qt.io/qbs/qbs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  qmake QBS_INSTALL_PREFIX=/usr qbs.pro 
  make
}

package() {
  cd "$_pkgname"
  INSTALL_ROOT="$pkgdir" make install
}
