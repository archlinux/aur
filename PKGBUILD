# Merged with official ABS akonadiconsole PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akonadiconsole-git
pkgver=24.04.40_r1904.gc705e9a
pkgrel=1
pkgdesc='Akonadi management and debugging console'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-search-git calendarsupport-git gcc-libs glibc kcalendarcore-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kitemmodels-git kmime-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libakonadi-git libkdepim-git messagelib-git qt6-base xapian-core)
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
