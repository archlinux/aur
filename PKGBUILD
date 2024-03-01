# Merged with official ABS kfind PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfind-git
pkgver=24.04.70_r2939.g1ed31f376
pkgrel=1
pkgdesc='Find Files/Folders'
arch=($CARCH)
url='https://apps.kde.org/kfind/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kfilemetadata-git ki18n-git kio-git kwidgetsaddons-git kxmlgui-git qt6-5compat qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('mlocate: search using mlocate index')
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
