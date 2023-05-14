# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Christoph Haag <christoph.haag@collabora.com>
# Author: Matthias Blaicher <matthias at blaicher dot com>

pkgname=disman-git
pkgver=0.527.80_r1871.geb61ea1
pkgrel=1
pkgdesc='Qt/C++ display management library by the KWinFT project (libkscreen fork)'
arch=($CARCH)
url='https://gitlab.com/kwinft/disman'
license=(LGPL)
depends=(kcoreaddons-git qt6-base)
makedepends=(git extra-cmake-modules-git kwayland-git libxcb wrapland-git)
optdepends=('libxcb: for the X11 backend plugin'
            'wrapland-git: for the KWinFT and wlroots backend plugins'
            'kwayland-git: for the KDE output-management backend plugin')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://gitlab.com/kwinft/disman.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
