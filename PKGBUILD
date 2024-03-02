# Merged with official ABS kmail PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kmail-git
pkgver=24.04.40_r27769.g24fe30875
pkgrel=1
pkgdesc="KDE mail client"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-import-wizard-git akonadi-mime-git akonadi-search-git gcc-libs glibc gpgme kbookmarks-git kcalendarcore-git kcalutils-git kcmutils-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git kdepim-runtime-git kguiaddons-git ki18n-git kiconthemes-git kidentitymanagement-git kio-git kitemmodels-git kitemviews-git kjobwidgets-git kldap-git kmail-account-wizard-git kmailtransport-git kmime-git knotifications-git knotifyconfig-git kontactinterface-git kparts-git kpimtextedit-git kservice-git kstatusnotifieritem-git ktextaddons-git ktextwidgets-git ktnef-git kuserfeedback-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libakonadi-git libgravatar-git libkdepim-git libkleo-git libksieve-git mailcommon-git mbox-importer-git messagelib-git pim-data-exporter-git pim-sieve-editor-git pimcommon-git qgpgme-qt6 qt6-base qt6-webengine qtkeychain-qt6 sonnet-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('kdepim-addons-git: additional plugins'
            'kleopatra-git: mail encryption support')
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
