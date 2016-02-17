# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.0.6
pkgrel=4
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'qt5-base' 'qt5-multimedia' 'ruby')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("https://launchpad.net/libopenshot/0.0/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" libopenshot-ffmpeg3.patch)
sha256sums=('8b1009b146ae5fab50a784534f32ef796cf5b4e59617dde7633fa5995e4ef0f9'
            '2d9d6a881944b6a04da90e89561996eeb46fb62183d12f86e529d29f0cd8be65')

prepare() {
  cd $pkgname-$pkgver
# Fix build with ffmpeg 3.0
  patch -p1 -i ../libopenshot-ffmpeg3.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 ../
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}

