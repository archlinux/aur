# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: sergeyshevch <sergeyshevchdevelop@gmail.com>

_pkgname=krunner-vscodeprojects
pkgname=$_pkgname-git
pkgver=r57.cb99fb6
pkgrel=1
pkgdesc="Open VSCode Project Manager projects from Krunner (git)"
arch=('any')
url="https://github.com/alex1701c/$_pkgname.git"
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
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname || exit 1

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_WITH_QT6=ON
  make -j$(nproc)
}

package() {
  cd $_pkgname || exit 1

  cd build
  make install DESTDIR="${pkgdir}"
}
