# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname='lightspark'
pkgver='0.9.0'
pkgrel='1'
pkgdesc='An open source flash player implementation'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL-3.0-only')
depends=('cairo' 'curl' 'ffmpeg' 'freetype2' 'glew' 'glib2' 'libgl' 'libjpeg' 'libpng' 'pango' 'rtmpdump' 'sdl2' 'xz' 'zlib')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
b2sums=('21133fcaf6f9b6b4cbd6842c68bb4d25b63a8654fe7d9c200600dd762bf4bc631164110ea25b4d8808a1d90b46bc1b2ab99e1df5a4d07202ecec422391da3737')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	mkdir -p "$srcdir/$_sourcedirectory/build/"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build/'
}

# The test suite depends on python2 and a bunch of abandoned software, which I wasn't able to get working

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
}
