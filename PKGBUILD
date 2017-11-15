# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.1.9
pkgrel=1
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz")
sha256sums=('2547969818092d77a1c742e27cf416b34b4d326abf6b089fc10b921f4a4141ec')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	export CXXFLAGS+=" -std=gnu++98"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 \
	      -DUSE_SYSTEM_JSONCPP=ON -DENABLE_RUBY=OFF ../
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="${pkgdir}" install
}
