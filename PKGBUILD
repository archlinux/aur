# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.4.3
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg' 'openslide')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('46eac8d5434b281afa6d64ced5f46c732c1c4d0699e16a22175b7df179221e2c')

build() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
  cd build
  cmake ../ \
	-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
	-DWITH_VIDEO_DECODING=On \
	-DWITH_VIDEO_DEVICE=On \
	-DWITH_OPENSLIDE_SUPPORT=On
  make
}

package() {
  cd $pkgname-$pkgver/build
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}
