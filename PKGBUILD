# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-device-sdk
pkgver=1.11
pkgrel=1
pkgdesc="A personal music streaming server that works."
arch=('any')
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('portaudio')
depends=('portaudio')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('8ddac6a258c8bc054e4eac3a65da1626294112c88da18e50d7359d980c380b392d0c81f5ac1f5faaceca7d19a72b408708a7f4d247246d5f6f24390b5236b1aa')

build() {
	cd "${srcdir}"
	mkdir -p build
	cd build
	cmake "../avs-device-sdk-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DSENSORY_KEY_WORD_DETECTOR=OFF \
		-DGSTREAMER_MEDIA_PLAYER=ON \
		-DPORTAUDIO=ON \
		-DPORTAUDIO_LIB_PATH="/usr/lib/libportaudio.so" \
		-DPORTAUDIO_INCLUDE_DIR="/usr/include"
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}" install
}
