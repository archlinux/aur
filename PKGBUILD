# maintainer: BrainDamage

pkgname=rtl_433
pkgver=21.12
pkgrel=2
pkgdesc="is a generic data receiver, mainly for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
depends=('rtl-sdr' 'soapysdr')
makedepends=('gcc' 'cmake' 'doxygen')
url="https://github.com/merbanan/rtl_433"
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b362ef3410adec64aee7ad8e6d4d74875f1b3d59ef6fb4856e96adc03876dc65')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../ \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	find examples -type f -exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" {} +;
	cd build_dir
	make DESTDIR="${pkgdir}" install
}

