# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('b0fa8b4571247833167b73d6fe5aab733160c09f56389b97c9e516d0f0f2a5de')

build() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
  cd build
  cmake ../ -DWITH_VIDEO_DECODING=On -DWITH_VIDEO_DEVICE=On -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd $pkgname-$pkgver/build
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}
