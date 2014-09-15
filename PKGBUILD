# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.0.3
pkgrel=1
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'swig' 'unittestpp')
source=("https://launchpad.net/libopenshot/0.0/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('43e8e4cdf46d417ef62ce8593dfe72129db05de8ec9ee7741480ab7ed1674c7e')

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

