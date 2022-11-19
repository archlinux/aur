# maintainer: BrainDamage

pkgname=rtl_433
pkgver=22.11
pkgrel=1
pkgdesc="is a generic data receiver, mainly for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
depends=('rtl-sdr' 'soapysdr')
makedepends=('gcc' 'cmake' 'doxygen')
url="https://github.com/merbanan/rtl_433"
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('61a9163d69cc4b1da46aebbcaf969bd180a055a6b90f42ad281218cc4fbefb86')


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

