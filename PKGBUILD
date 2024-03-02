# Merged with official ABS labplot PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=labplot-git
pkgver=2.10.1_r13464.g70d78bde4
pkgrel=1
arch=($CARCH)
pkgdesc="KDE Application for interactive graphing and analysis of scientific data"
url="https://labplot.kde.org/"
license=(GPL2)
depends=(cantor-git cblas cfitsio discount fftw gcc-libs glibc gsl hdf5 karchive5 kcompletion5 kconfig5 kconfigwidgets5 kcoreaddons5 kcrash5 ki18n5 kiconthemes5 kio5 kparts5 ktextwidgets5 kwidgetsaddons5 kxmlgui5 libcerf libmatio liborigin lz4 netcdf poppler-qt5 qt5-base qt5-mqtt qt5-serialport qt5-svg qxlsx-qt5 readstat syntax-highlighting5 vector-blf zlib)
makedepends=(git dbc-parser-cpp extra-cmake-modules-git kdoctools5)
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
