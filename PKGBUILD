# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=5.20.80_r1432.gadf5435
pkgrel=1
pkgdesc="App and daemon for display managing by KWinFT project, forked from KDE's KScreen"
arch=($CARCH)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
groups=(plasma-git)
depends=(kcmutils-git kdeclarative-git kirigami2-git ki18n-git plasma-framework-git qt5-graphicaleffects qt5-sensors)
makedepends=(git disman-git extra-cmake-modules-git kcmutils-git)
provides=(kdisplay)
conflicts=(kdisplay kscreen)
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
