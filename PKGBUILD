# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=apulse
pkgver=0.1.14
pkgrel=1
pkgdesc='PulseAudio emulation for ALSA'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/apulse'
license=('custom:MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cmake')
install=apulse.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'asoundrc.sample')
sha256sums=('9208e71de64579222661945edca16ec1f57d02a58b958f2e654d588a8f4ca3e3'
            'e851197ec9ebff528154210751cd6d5c426abfc2b1aa34343580407b1ea789a4')

prepare() {
	cd apulse-${pkgver}

	mkdir -p build
}

build() {
	cd apulse-${pkgver}/build

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd apulse-${pkgver}/build

	make DESTDIR="${pkgdir}/" install

	# sample asoundrc
	install -Dm644 ../../${source[1]} \
		"${pkgdir}/usr/share/${pkgname}/${source[1]}"

	# license
	install -Dm644 ../LICENSE.MIT \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

