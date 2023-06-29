# Maintainer: BrainDamage

pkgname=bee-host
pkgver=1.3.6
pkgrel=1
pkgdesc="A native messaging host application for Browser's Exernal Editor extension."
arch=(x86_64)
url="https://github.com/rosmanov/bee-host"
license=('MIT')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}::https://github.com/rosmanov/bee-host/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e45bb1ff96a0e2899b0ed47164b36073cb03a10b6386ba8ce8126c1091dc8037')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/ \
		-DCMAKE_INSTALL_LIBDIR:PATH=lib
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}" install
	cp -rv "${pkgdir}/etc/opt/chrome" "${pkgdir}/etc"
	mv -v "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/bin"
	mv -v "${pkgdir}/usr/local/bin" "${pkgdir}/usr"
	rmdir "${pkgdir}/usr/local"
}
