# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname='lightspark'
pkgver='0.8.7'
pkgrel='1'
pkgdesc='An open source flash player implementation'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL-3.0-only')
depends=('cairo' 'curl' 'ffmpeg' 'freetype2' 'glew' 'glib2' 'libgl' 'libjpeg' 'libpng' 'pango' 'rtmpdump' 'sdl2' 'xz' 'zlib')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('a0207629238054d669710fcb4d6b1904624d4ed8fb19cf822447e55107d6c3596f6e9fb425c14968365a1c8224b7c3a899008428fd69c9714a03a74230e64f2f')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	mkdir -p "$srcdir/$_sourcedirectory/build/"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -G Ninja -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release'
	ninja -C 'build/'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" ninja -C 'build/' install
}
