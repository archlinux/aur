# Merged with official ABS kronometer PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kronometer-git
pkgver=2.3.70_r907.gd1fd577
pkgrel=2
pkgdesc="A simple chronometer application"
arch=($CARCH)
url="https://userbase.kde.org/Kronometer"
license=(GPL2)
depends=(gcc-libs glibc kconfig5 kconfigwidgets5 kcoreaddons5 kcrash5 ki18n5 kwidgetsaddons5 kxmlgui5 qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')' | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
