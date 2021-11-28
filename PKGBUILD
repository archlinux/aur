# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=5.23.80_r1456.gc03ddcb
pkgrel=1
pkgdesc="App and daemon for display managing by the KWinFT project (kscreen fork)"
arch=($CARCH)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=(kcmutils kdeclarative kirigami2 ki18n plasma-framework qt5-graphicaleffects qt5-sensors)
makedepends=(git disman-git extra-cmake-modules kcmutils)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
