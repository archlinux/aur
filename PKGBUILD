# Merged with official ABS kleopatra PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kleopatra-git
pkgver=24.04.70_r8148.g876d94c0c
pkgrel=1
pkgdesc='Certificate Manager and Unified Crypto GUI'
arch=($CARCH)
url='https://www.kde.org/applications/utilities/kleopatra/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi-mime-git gcc-libs glibc gpgme kcmutils-git kcodecs-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kiconthemes-git kidentitymanagement-git kio-git kitemmodels-git kmailtransport-git kmime-git kstatusnotifieritem-git ktextwidgets-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libassuan libgpg-error libkleo-git mimetreeparser-git qgpgme-qt6 qt6-base sh)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _patch_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_patch_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
