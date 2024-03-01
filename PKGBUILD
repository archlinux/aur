# Merged with official ABS messagelib PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=messagelib-git
pkgver=6.0.42_r7783.g6c19cce20
pkgrel=1
pkgdesc="KDE PIM messaging library"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-mime-git akonadi-search-git gcc-libs glibc gpgme grantleetheme-git karchive-git kcalendarcore-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kguiaddons-git ki18n-git kiconthemes-git kitemviews-git kmailtransport-git kmime-git kidentitymanagement-git kio-git kitemmodels-git kjobwidgets-git kmbox-git kpimtextedit-git kservice-git ktextaddons-git ktexttemplate-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libakonadi-git libgravatar-git libkdepim-git libkleo-git pimcommon-git qca-qt6-git qgpgme-qt6 qt6-base qt6-webengine sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
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
