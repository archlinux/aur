# Contributer: Donald Carr<sirspudd@gmail.com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.1
pkgver=${_pkgvermajmin}.0
_verpostfix="-rc1"
_pkgver=${pkgver}${_verpostfix}
_filename=qt-creator-opensource-src-${_pkgver}
_devurlbase="https://download.qt.io/development_releases"
_relurlbase="https://download.qt.io/official_releases"
pkgrel=2
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
source=("${_devurlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('0bc3b2038d2ab1934a25aa93efe247154e09f91baeec630fe23872b5b0dfc60e')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro ${_qmake_args}
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
