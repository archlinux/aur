# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.1.3
pkgrel=3
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("https://launchpad.net/libopenshot/0.1/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f63dd962532aab374e08f8d29b63baa7aae8538ce074edcaddd9f054b5beff1d')

build() {
	mkdir build
	cd build
        export CXXFLAGS+=" -std=gnu++98"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 \
              -DUSE_SYSTEM_JSONCPP=ON -DENABLE_RUBY=OFF ../
	make
}

package() {
        cd build
	make DESTDIR="${pkgdir}" install
}
