# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkexiv2-frameworks-git
pkgver=5.0.0.r733.bba8e5f
pkgrel=1
pkgdesc='A wrapper around Exiv2 library to manipulate pictures metadata as EXIF IPTC and XMP. KF5 Frameworks branch. (GIT version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdegraphics/libs/libkexiv2'
license=('LGPL')
depends=('ktextwidgets' 'exiv2')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('libkexiv2')
source=('git://anongit.kde.org/libkexiv2#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkexiv2
  _ver="$(cat CMakeLists.txt | grep -m3 -e KEXIV2_LIB_MAJOR_VERSION -e KEXIV2_LIB_MINOR_VERSION -e KEXIV2_LIB_PATCH_VERSION | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkexiv2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
