# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.2.1
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('2ef2e1b79c3bf82e951ad35628bc0387fe8260052614a213385de82fcfa901ec')

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
