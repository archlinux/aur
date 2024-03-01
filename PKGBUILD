# Merged with official ABS mailcommon PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=mailcommon-git
pkgver=6.0.40_r1709.g56ffc5d1
pkgrel=1
pkgdesc="KDE PIM library providing support for mail applications"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-mime-git gcc-libs glibc gpgme karchive-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git ki18n-git kiconthemes-git kidentitymanagement-git kio-git kitemviews-git kmailtransport-git kmime-git ktextaddons-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libakonadi-git libkdepim-git libkleo-git mailimporter-git messagelib-git phonon-qt6-git pimcommon-git qgpgme-qt6 qt6-base syntax-highlighting-git)
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
