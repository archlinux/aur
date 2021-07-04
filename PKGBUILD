# Merged with official ABS yakuake PKGBUILD by João, 2021/07/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=yakuake-git
pkgver=21.07.70_r722.g0eb3a30
pkgrel=1
pkgdesc='A drop-down terminal emulator based on KDE konsole-git technology'
arch=($CARCH)
url='https://apps.kde.org/yakuake/'
license=(GPL)
depends=(konsole-git kwayland-git hicolor-icon-theme)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-utilities-git)
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
