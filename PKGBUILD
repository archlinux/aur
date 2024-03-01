# Merged with official ABS akonadi-search PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=akonadi-search-git
pkgver=6.0.40_r1595.ga275f05
pkgrel=1
pkgdesc="Libraries and daemons to implement searching in Akonadi"
url='https://kontact.kde.org'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi-mime-git gcc-libs glibc kcalendarcore-git kcmutils-git kcodecs-git kcompletion-git kconfig-git kcontacts-git kcoreaddons-git ki18n-git kmime-git krunner-git ktextaddons-git kwidgetsaddons-git libakonadi-git qt6-base xapian-core)
makedepends=(git corrosion doxygen extra-cmake-modules-git qt6-doc qt6-tools)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
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
