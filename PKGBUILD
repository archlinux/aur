# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: sergeyshevch <sergeyshevchdevelop@gmail.com>

_pkgname=krunner-vscodeprojects
pkgname=$_pkgname
pkgver=2.0.2
pkgrel=1
pkgdesc="Open VSCode Project Manager projects from Krunner"
arch=('any')
url="https://github.com/alex1701c/$_pkgname.git"
source=("https://github.com/alex1701c/$_pkgname/archive/${pkgver}.tar.gz")
md5sums=('ae1fd094d0bb5ece4f78f2e52990feb6')
groups=()
depends=(
  krunner
  kservice
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

  cmake .. -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_WITH_QT6=ON
  make -j$(nproc)
}

package() {
  cd "${_pkgname}-${pkgver}" || exit 1

  cd build
  make install DESTDIR="${pkgdir}"
}
