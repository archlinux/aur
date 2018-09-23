# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.2
pkgrel=1
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('x86_64')
url="https://openshot.org/"
license=('LGPL3')
depends=('libmagick6' 'ffmpeg' 'x264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz")
sha256sums=('3f92d42b9fdb66e62429a076678b1feae7de06751efc4217347a78282e86f0cc')

build() {
	cd ${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 \
	      -DUSE_SYSTEM_JSONCPP=ON -DENABLE_RUBY=OFF ../
	make
}

package() {
	cd ${pkgname}-${pkgver}
	cd build
	make DESTDIR="${pkgdir}" install
}
