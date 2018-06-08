# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=pingtcp
pkgver=0.0.4
pkgrel=2
pkgdesc="Small utility to measure TCP handshake time (torify-friendly)"
url="https://gitlab.com/post-factum/${pkgname}"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('glibc' 'gcc-libs' 'libunwind' 'gperftools')
optdepends=('torsocks: for TOR support')
makedepends=('gcc' 'cmake' 'make' 'libunwind' 'gperftools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pfactum/${pkgname}/archive/v${pkgver}.tar.gz)

sha256sums=('ba6f3eb2660f703394bd0d40271a71f4d03434c89d71ae92ba2a2dcb50fd6ea6')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	make install
}

