# Merged with official ABS kgpg PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: frames <markkuehn at outlook dot com> 

pkgname=kgpg-git
pkgver=24.04.70_r3451.gc6de51a8
pkgrel=1
pkgdesc='A GnuPG frontend'
url='https://apps.kde.org/kgpg/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi-contacts-git gcc-libs glibc karchive-git kcodecs-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kio-git kservice-git kstatusnotifieritem-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git libakonadi-git qt6-5compat qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-utilities-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
