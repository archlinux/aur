# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=lightspark
pkgver=0.8.4
pkgrel=1
pkgdesc='An open source flash player implementation'
url='https://github.com/lightspark/lightspark'
arch=('x86_64')
license=('LGPL3')
depends=('libgl' 'curl' 'ffmpeg' 'zlib' 'glew' 'pcre' 'rtmpdump' 'cairo' 'sdl2' 'sdl2_mixer' 'libjpeg' 'pango' 'xz')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("https://github.com/lightspark/lightspark/archive/${pkgver}.tar.gz")
sha512sums=('a69a73b6e0c5227bb63e94c15ffaa83df6ed18d400c50fd6f845b455d2b49a1acdc45f1f75c14894492ba5db9e38d1fbbac315359d4b73434832c05873b22091')

build() {
	cd "${pkgname}-${pkgver}"
	mkdir -p out
	cd out
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	ninja
}

package() {
	cd "${pkgname}-${pkgver}/out"
	DESTDIR="${pkgdir}" ninja install
}
