# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('b84387c82cf1c69b8dbf6d9fa8a87329982e4fdbe370fa0a150e2dccb8e2c7d9')

build() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
  cd build
  cmake ../ -DWITH_VIDEO_DECODING=On -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd $pkgname-$pkgver/build
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}
