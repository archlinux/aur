# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=6.0.0_r1602.ga606d52
pkgrel=2
pkgdesc="App and daemon for display managing by the KWinFT project (kscreen fork)"
arch=($CARCH)
url="https://github.com/winft/${pkgname%-git}"
license=(LGPL)
depends=(kcmutils-git kdeclarative-git kirigami-git ki18n-git libplasma-git qt6-sensors)
makedepends=(git disman-git extra-cmake-modules-git kcmutils-git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -im1 "project(${pkgname%-git} VERSION" CMakeLists.txt | sed 's/.* //; s/-/./g; s/)//')"
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
