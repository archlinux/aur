# Merged with official ABS kaccounts-integration PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org> 

pkgname=kaccounts-integration-git
pkgver=24.01.90_r1440.gbecf963
pkgrel=1
pkgdesc='Online account management system and its Plasma integration components'
arch=($CARCH)
url='https://www.kde.org/'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc kcmutils-git kconfig-git kcoreaddons-git kdbusaddons-git ki18n-git kio-git kirigami-git kwallet-git libaccounts-qt qt6-base signon-kwallet-extension-git signon-plugin-oauth2 signon-ui signond)
makedepends=(git extra-cmake-modules-git kdoctools-git qcoro-qt6)
optdepends=('qt6-declarative: QML plugin')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
