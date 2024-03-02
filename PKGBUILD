# Merged with official ABS mimetreeparser PKGBUILD by João, 2024/03/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=mimetreeparser-git
pkgver=24.02.0_r472.gae5a0d7
pkgrel=1
pkgdesc='Parser for MIME trees'
arch=($CARCH)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc gpgme kcalendarcore-git ki18n-git kirigami-git kmbox-git kmime-git kwidgetsaddons-git libkleo-git qgpgme-qt6 qt6-base qt6-declarative qt6-webengine)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
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
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
