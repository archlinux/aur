# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=lightspark
pkgver=0.8.3
pkgrel=1
pkgdesc='An open source flash player implementation'
url='https://github.com/lightspark/lightspark'
arch=('x86_64')
license=('LGPL3')
depends=('libgl' 'curl' 'ffmpeg' 'zlib' 'glew' 'pcre' 'rtmpdump' 'cairo' 'sdl2' 'sdl2_mixer' 'libjpeg' 'pango' 'xz' 'boost-libs' 'glibmm')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=("https://github.com/lightspark/lightspark/archive/${pkgver}.tar.gz")
sha512sums=('023d1872577445a857c77908bc2ec83ebfa086bc77161dfd22b53fc0c38eb5d94cd5bb5c5a7508dee2039d3b8479c917dcee089fe551a984ec5525a5ae781997')

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
