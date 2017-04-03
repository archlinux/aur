# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.3
pkgver=${_pkgvermajmin}.0
_verpostfix="-beta1"
pkgrel=1
_pkgver=${pkgver}${_verpostfix}
_filename=qt-creator-opensource-src-${_pkgver}
_urlbase="https://download.qt.io/official_releases"
if [[ -n $_verpostfix ]]; then
  _urlbase="https://download.qt.io/development_releases"
fi
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-tools' 'qt5-declarative' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'clang' 'qbs')
makedepends=('clang' 'qt5-base')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('9f5e28747281a2e75e5f875d37fad9422ee264357b2e752c450dad5b568229e2')

build() {
  cd "$srcdir/${_filename}"
  QMAKESPEC=linux-clang qmake -r QTC_PREFIX=/usr qtcreator.pro ${_qmake_args}
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
