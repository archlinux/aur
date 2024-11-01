# maintainer: BrainDamage

pkgname=rtl_433
pkgver=24.10
pkgrel=1
pkgdesc="is a generic data receiver, mainly for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
depends=('rtl-sdr' 'soapysdr')
makedepends=('gcc' 'cmake' 'doxygen')
url="https://github.com/merbanan/rtl_433"
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e5ab1597a723bf9e0eaa56be988b23dae3670471c6472510ba07b3b588407dcb')

build() {
	cmake -B "${srcdir}/build_dir" -S "${srcdir}/${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build "${srcdir}/build_dir"
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/build_dir"
	find "${srcdir}/${pkgname}-${pkgver}/examples" -type f -exec \
		install -Dvm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" {} +;
}

