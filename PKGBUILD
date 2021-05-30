# Merged with official ABS labplot PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=labplot-git
pkgver=2.9.0_r8443.g48ee28c12
pkgrel=1
arch=($CARCH)
pkgdesc="KDE Application for interactive graphing and analysis of scientific data"
url="https://labplot.kde.org/"
license=(GPL2)
depends=(cantor-git netcdf cfitsio fftw gsl qt5-serialport libcerf qt5-mqtt kuserfeedback-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'add_definitions (-DLVERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git}
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
