# Merged with official ABS labplot PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=labplot-git
pkgver=2.10.1_r13462.gd4dd57e26
pkgrel=1
arch=($CARCH)
pkgdesc="KDE Application for interactive graphing and analysis of scientific data"
url="https://labplot.kde.org/"
license=(GPL2)
depends=(cantor-git cblas cfitsio discount fftw gcc-libs glibc gsl hdf5 karchive5-git kcompletion5-git kconfig5-git kconfigwidgets5-git kcoreaddons5-git kcrash5-git ki18n5-git kiconthemes5-git kio5-git kparts5-git ktextwidgets5-git kwidgetsaddons5-git kxmlgui5-git libcerf libmatio liborigin lz4 netcdf poppler-qt5 qt5-base qt5-mqtt qt5-serialport qt5-svg qxlsx-qt5 readstat syntax-highlighting5-git vector-blf zlib)
makedepends=(git dbc-parser-cpp extra-cmake-modules-git kdoctools5-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(LABPLOT_VERSION' CMakeLists.txt | cut -d ' ' -f2 | tr - . | tr -d ')')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git}
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
