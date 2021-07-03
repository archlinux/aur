# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=lightspark
pkgver=0.8.5
pkgrel=1
pkgdesc='An open source flash player implementation'
url='https://github.com/lightspark/lightspark'
arch=('x86_64' 'aarch64')
license=('LGPL3')
depends=('libgl' 'curl' 'ffmpeg' 'zlib' 'glew' 'pcre' 'rtmpdump' 'cairo' 'sdl2' 'sdl2_mixer' 'libjpeg' 'pango' 'xz')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("https://github.com/lightspark/lightspark/archive/${pkgver}.tar.gz")
sha512sums=('79e78925f9132b2c6044e4abf326d768c8d45509f85d9123e3dd172b2769772567223676fa7c8ea4d08bc541e9aa7a2b2d5a1062ff9f3a6274234af8798ee11b')

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
