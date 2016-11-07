# Contributer: Donald Carr<sirspudd@gmail.com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.2
pkgver=${_pkgvermajmin}.0
_verpostfix="-beta1"
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
makedepends=('gcc' 'qt5-base')
source=("${_devurlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('6f3d95ae50991e0a57a878ecdfb1e49f068743f998b17c4fea26d64fe3e5336f')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro ${_qmake_args}
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
