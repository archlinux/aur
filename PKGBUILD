# Merged with official ABS ktimetracker PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ktimetracker-git
pkgver=6.0.0_r3902.gd0da637
pkgrel=1
pkgdesc='Todo management and time tracker'
url='https://userbase.kde.org/KTimeTracker'
license=(GPL2)
depends=(gcc-libs glibc kcalendarcore5 kconfig5 kconfigwidgets5 kcoreaddons5 kdbusaddons5 ki18n5 kidletime5 kio5 kjobwidgets5 knotifications5 ktextwidgets5 kwidgetsaddons5 kwindowsystem5 kxmlgui5 qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(APP_VERSION_NUMBER' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
