# Merged with official ABS akonadi-calendar-tools PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akonadi-calendar-tools-git
pkgver=6.0.40_r1177.gbe4e54f
pkgrel=1
pkgdesc='CLI tools to manage akonadi calendars'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL-2.0-or-later)
depends=(akonadi-calendar-git calendarsupport-git gcc-libs glibc kcalendarcore-git kcoreaddons-git ki18n-git libakonadi-git qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
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
