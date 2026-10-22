# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname='lightspark'
pkgver='0.10.0'
pkgrel='1'
pkgdesc='An open source flash player implementation'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL-3.0-only')
depends=('curl' 'ffmpeg' 'freetype2' 'libgl' 'libjpeg-turbo' 'libpng' 'rtmpdump' 'sdl2' 'xz' 'zlib')
makedepends=('cmake' 'nasm' 'ninja')
optdepends=('fontconfig: system font detection')
conflicts=('pepper-flash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
b2sums=('709996048b7cfd68839bb6516ab0ca689059e0e4f38e3fb70a6573becd1206012ebe1e88db31adda628cfd777dd3c6ce60be2bac1fde356711a15b2e25214e65')

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
