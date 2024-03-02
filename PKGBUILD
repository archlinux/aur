# Merged with official ABS ksysguard PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=ksysguard-git
pkgver=5.22.80_r3593.g2c18f3bd
pkgrel=2
pkgdesc='Track and control the processes running in your system'
arch=($CARCH)
url='https://userbase.kde.org/KSysGuard'
license=(LGPL)
depends=(gcc-libs glibc kcompletion5 kconfig5 kconfigwidgets5 kcoreaddons5 kdbusaddons5 ki18n5 kiconthemes5 kio5 knewstuff5 knotifications5 ksystemstats-git kwidgetsaddons5 kwindowsystem5 kxmlgui5 libksysguard-git lm_sensors qt5-base)
makedepends=(git extra-cmake-modules-git kdoctools5)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
install=${pkgname%-git}.install
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
