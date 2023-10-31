# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: sergeyshevch <sergeyshevchdevelop@gmail.com>

_pkgname=krunner-vscodeprojects
pkgname=$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc="Open VSCode Project Manager projects from Krunner"
arch=('any')
url="https://github.com/alex1701c/$_pkgname.git"
source=("https://github.com/alex1701c/$_pkgname/archive/${pkgver}.tar.gz")
md5sums=('e81610c334b09c08980d154968219661')
groups=()
depends=(
  krunner5
  kservice5
)
makedepends=(
  cmake
  extra-cmake-modules
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
license=(LGPL3)
options=()

build() {
  cd "${_pkgname}-${pkgver}" || exit 1

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release  ..
  make -j$(nproc)
}

package() {
  cd "${_pkgname}-${pkgver}" || exit 1

  cd build
  make install DESTDIR="${pkgdir}"
}
