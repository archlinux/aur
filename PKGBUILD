# Merged with official ABS kdepim-addons PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdepim-addons-git
pkgver=6.0.40_r5870.gc3548540a
pkgrel=1
pkgdesc='Addons for KDE PIM applications'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi-calendar-git akonadi-contacts-git akonadi-import-wizard-git akonadi-mime-git akonadi-notes-git calendarsupport-git discount eventviews-git gcc-libs glibc gpgme grantleetheme-git incidenceeditor-git kcalendarcore-git kcalutils-git kcmutils-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kdeclarative-git kguiaddons-git kholidays-git ki18n-git kiconthemes-git kidentitymanagement-git kimap-git kio-git kirigami-git kirigami-addons-git kitemmodels-git kitemviews-git kitinerary-git kmailtransport-git kmime-git kpimtextedit-git kpkpass-git kservice-git ktextaddons-git ktexttemplate-git ktnef-git kwidgetsaddons-git kxmlgui-git libakonadi-git libgravatar-git libkleo-git libksieve-git mailcommon-git mailimporter-git messagelib-git pimcommon-git prison-git qgpgme-qt6 qt6-base qt6-declarative qt6-webengine sh syntax-highlighting-git)
makedepends=(git corrosion extra-cmake-modules-git kdoctools-git kaddressbook-git)
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
