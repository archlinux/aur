# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
_pkgname=libopenshot1
pkgver=0.0.2
pkgrel=2
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'swig' 'unittestpp')
source=("https://launchpad.net/libopenshot/0.0/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('05b3b9ef07ec8ecc9c5850851af900fa')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 ../
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}

