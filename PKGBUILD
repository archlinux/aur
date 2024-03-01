# Merged with official ABS ktimetracker PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ktimetracker-git
pkgver=6.0.0_r3894.g20d407d
pkgrel=1
pkgdesc='Todo management and time tracker'
url='https://userbase.kde.org/KTimeTracker'
license=(GPL2)
depends=(gcc-libs glibc kcalendarcore5-git kconfig5-git kconfigwidgets5-git kcoreaddons5-git kdbusaddons5-git ki18n5-git kidletime5-git kio5-git kjobwidgets5-git knotifications5-git ktextwidgets5-git kwidgetsaddons5-git kwindowsystem5-git kxmlgui5-git qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5-git)
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
