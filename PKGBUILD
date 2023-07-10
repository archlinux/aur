# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=1.5.0
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg' 'openslide' 'libsixel' 'libdeflate')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('aa457f401b0517ba814efc62ededa3ab3f4edc1f40fb6048c58d52f01dfd9ba2')

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
