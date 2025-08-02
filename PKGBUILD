# Merged with official ABS labplot PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=labplot-git
pkgver=2.12.0_r16121.g39a028dd6
pkgrel=1
arch=($CARCH)
pkgdesc='KDE Application for interactive graphing and analysis of scientific data'
url='https://labplot.kde.org/'
license=(GPL-2.0-or-later)
depends=(cantor-git cblas cfitsio discount fftw gcc-libs glibc gsl hdf5 karchive-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git ki18n-git kiconthemes-git kio-git kparts-git ktextwidgets-git kuserfeedback-git kwidgetsaddons-git kxmlgui-git libcerf libixion libmatio liborcus liborigin lz4 netcdf poppler-qt6 purpose-git qt-advanced-docking-system qt6-base qt6-mqtt qt6-serialport qt6-svg qxlsx readstat syntax-highlighting-git vector-blf zlib zstd)
makedepends=(git boost dbc-parser-cpp eigen extra-cmake-modules-git kdoctools-git knewstuff-git)
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
    -DENABLE_TESTS=OFF \
    -DLOCAL_DBC_PARSER=OFF \
    -DLOCAL_VECTOR_BLF=OFF
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
