# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.5.2
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg' 'openslide' 'libsixel' 'libdeflate')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('f0c604e2cab03bbd213b20333a9b90ea1211af730de2b914402e7275111f804e')

build() {
  cd "$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake ../ \
	-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
	-DWITH_VIDEO_DEVICE=On \
	-DWITH_OPENSLIDE_SUPPORT=On \
	-DWITH_STB_IMAGE=Off
  make
}

package() {
  cd "$pkgname-$pkgver"/build
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}
