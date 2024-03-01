# Merged with official ABS korganizer PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=korganizer-git
pkgver=24.04.40_r12529.g288280c20
pkgrel=1
pkgdesc="Calendar and scheduling Program"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(akonadi-calendar-git akonadi-contacts-git akonadi-notes-git calendarsupport-git eventviews-git gcc-libs glibc incidenceeditor-git kcalendarcore-git kcalutils-git kcmutils-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdepim-runtime-git kholidays-git ki18n-git kiconthemes-git kidentitymanagement-git kio-git kitemmodels-git kitemviews-git kjobwidgets-git kmailtransport-git kmime-git knewstuff-git kontactinterface-git kparts-git kuserfeedback-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libakonadi-git libkdepim-git pimcommon-git qt6-base qt6-tools)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('kdepim-addons: additional plugins')
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
