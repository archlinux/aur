# Merged with official ABS kscreenlocker PKGBUILD by João, 2021/04/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marcin Mikołajczak <me@mkljczk.pl>

pkgname=kscreenlocker-git
pkgver=5.27.80_r1146.g71cc703
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
groups=(plasma-git)
depends=(kidletime-git kwayland-git kdeclarative-git perl layer-shell-qt-git plasma-framework-git)
makedepends=(git extra-cmake-modules-git kdoctools-git kcmutils-git libxcursor)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kcmutils-git: configuration module')
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
