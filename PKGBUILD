# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.2
pkgver=${_pkgvermajmin}.0
_verpostfix=""
_pkgver=${pkgver}${_verpostfix}
_filename=qt-creator-opensource-src-${_pkgver}
_devurlbase="https://download.qt.io/development_releases"
_relurlbase="https://download.qt.io/official_releases"
pkgrel=3
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-base')
makedepends=('clang' 'qt5-base')
source=("${_relurlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('203e2bc6618590b5e5a7e17f1a05e65b255d742f0b8f0ba3246fb541dfdfbe80')

build() {
  cd "$srcdir/${_filename}"
  QMAKESPEC=linux-clang qmake -r QTC_PREFIX=/usr qtcreator.pro ${_qmake_args}
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
