# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.4.5
pkgrel=2
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg' 'openslide')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('3c96476ce4ba2af4b9f639c5b59ded77ce1a4511551a04555ded105f14398e01')

build() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
  cd build
  cmake ../ \
	-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
	-DWITH_VIDEO_DECODING=On \
	-DWITH_VIDEO_DEVICE=On \
	-DWITH_OPENSLIDE_SUPPORT=On \
	-DWITH_STB_IMAGE=Off
  make
}

package() {
  cd $pkgname-$pkgver/build
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}
