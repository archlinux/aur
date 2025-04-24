# Maintainer: BrainDamage

pkgname=bee-host
pkgver=1.3.7.3v2
_upstreamver=1.3.7-3v2
pkgrel=1
pkgdesc="A native messaging host application for Browser's Exernal Editor extension."
arch=(x86_64)
url="https://github.com/rosmanov/bee-host"
license=('MIT')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}::https://github.com/rosmanov/bee-host/archive/refs/tags/${_upstreamver}.tar.gz")
sha256sums=('d1e179a268718ef64e917f64b3b1a0b8367ba773d793863a537009b4c269deeb')


build() {
	cd "${srcdir}/${pkgname}-${_upstreamver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/ \
		-DCMAKE_INSTALL_LIBDIR:PATH=lib
	make
}

package() {
	cd "${srcdir}/${pkgname}-${_upstreamver}"
	cd build_dir
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
	cp -rv "${pkgdir}/etc/opt/chrome" "${pkgdir}/etc"
	mv -v "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/bin"
	mv -v "${pkgdir}/usr/local/bin" "${pkgdir}/usr"
	rmdir "${pkgdir}/usr/local"
}
