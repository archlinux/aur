# Merged with official ABS signon-kwallet-extension PKGBUILD by João, 2021/02/18 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=signon-kwallet-extension-git
pkgver=21.03.70_r63.ge2463a9
pkgrel=1
pkgdesc="KWallet integration for signon framework"
arch=($CARCH)
url="https://kde.org"
license=(LGPL)
groups=(kde-applications-git kde-network-git)
depends=(signond kwallet-git)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
