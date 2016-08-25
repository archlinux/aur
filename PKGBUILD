# Contributer: Donald Carr<sirspudd@gmail.com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.1
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
makedepends=('gcc' 'qt5-base')
source=("${_relurlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('d00f84539203c8456a6ebca149228cd22d1bae7f41c95c88f6fc63a02aeed8c3')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro ${_qmake_args}
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
