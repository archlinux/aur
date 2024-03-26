# Merged with official ABS kolourpaint PKGBUILD by João, 2024/03/26 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=kolourpaint-git
pkgver=24.04.70_r2667.g24e7731b
pkgrel=1
pkgdesc='Paint Program'
url='https://apps.kde.org/kolourpaint/'
arch=($CARCH)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc kconfig5 kconfigwidgets5 kcoreaddons5 kguiaddons5 ki18n5 kio5 kjobwidgets5 ktextwidgets5 kwidgetsaddons5 kxmlgui5 libksane-git qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5)
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
