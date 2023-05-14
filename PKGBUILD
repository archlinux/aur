# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=5.27.80_r1542.gd243e46
pkgrel=1
pkgdesc="App and daemon for display managing by the KWinFT project (kscreen fork)"
arch=($CARCH)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=(kcmutils-git kdeclarative-git kirigami2-git ki18n-git plasma-framework-git qt6-sensors)
makedepends=(git disman-git extra-cmake-modules-git kcmutils-git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://gitlab.com/kwinft/kdisplay.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
