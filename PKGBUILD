# Maintainer: Bartosz Slawianowski <me2.legion at gmail dot com>
pkgname=ffmpegthumbs-git
pkgver=r91.c06602f
pkgrel=1
pkgdesc="FFmpeg-based thumbnail creator for video files"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/kdemultimedia/ffmpegthumbs"
depends=('ffmpeg' 'kio')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/ffmpegthumbs#branch=frameworks")
license=('GPL')
md5sums=('SKIP')

pkgver() {
  cd ffmpegthumbs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ffmpegthumbs \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

