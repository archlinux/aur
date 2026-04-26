# Maintainer: S4 Solutions, LLC <luke@s4solutions.ai>
# Contributor: Gemini CLI

pkgname=nexis-git
_pkgname=Nexis
pkgver=2.3.3.r19.g305436b
pkgrel=1
pkgdesc="Linux & macOS System Optimizer and Monitoring (Qt6)"
arch=('x86_64' 'aarch64')
url="https://github.com/s4solutionsllc/Nexis"
license=('GPL3')
depends=('qt6-base' 'qt6-charts' 'qt6-svg' 'hicolor-icon-theme' 'polkit')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('psmisc: for killall support'
            'smartmontools: for disk health monitoring'
            'systemd: for service management')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DCXXBASICS_USE_FASTER_LINKERS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
