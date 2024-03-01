# Merged with official ABS kalgebra PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kalgebra-git
pkgver=24.04.70_r2299.g56741e86
pkgrel=1
pkgdesc='Graph Calculator'
url='https://apps.kde.org/kalgebramobile/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(analitza-git gcc-libs glibc kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git ki18n-git kio-git kwidgetsaddons-git kxmlgui-git qt6-base qt6-declarative qt6-webengine readline)
makedepends=(git extra-cmake-modules-git kdoctools-git libplasma-git)
optdepends=('kirigami: for KAlgebra Mobile')
arch=($CARCH)
groups=(kde-applications-git kde-education-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
