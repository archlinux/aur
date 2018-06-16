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
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/post-factum/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)

sha256sums=('23582f215881f635911e03aeb5789f32d385ddacab5726f9eabbcff59b61aa7c')

prepare() {
	cd "${srcdir}/${pkgname}-v${pkgver}"

	mkdir -p build
}

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build"

	make install
}

