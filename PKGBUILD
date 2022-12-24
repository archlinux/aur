# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname='lightspark'
pkgver='0.8.6.1'
pkgrel='1'
pkgdesc='An open source flash player implementation'
arch=('x86_64' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL3')
depends=('cairo' 'curl' 'ffmpeg' 'freetype2' 'glew' 'glib2' 'libgl' 'libjpeg' 'libpng' 'pango' 'rtmpdump' 'sdl2' 'sdl2_mixer' 'xz' 'zlib')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ea54b3d66acfcb12aac271669d550f6aa1709db59d4bcc005479b7be394a4ca30473a993a780c632228eeaad2977d97cdbcadff5cf8abbbf07503f9d56192f31')

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
