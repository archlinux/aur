# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: [object Object] <objekt-Objekt@proton.me>

pkgname=libquotient-encryption
pkgver=0.7.2
pkgrel=1
pkgdesc="A Qt library to write cross-platform clients for Matrix (with experimental encryption support)"
arch=(x86_64 aarch64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2.1")
depends=("gcc-libs" "glibc" "libolm" "openssl" "qt5-base" "qt5-multimedia" "qtkeychain-qt5")
makedepends=("cmake")
provides=("libquotient" "libQuotient.so=${pkgver%.*}-64")
conflicts=("libquotient")
source=("https://github.com/quotient-im/libQuotient/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("62ff42c8fe321e582ce8943417c1d815ab3f373a26fa0d99a5926e713f6a9382")

build() {
	cmake -B build -S "libQuotient-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=1 \
		-DQuotient_ENABLE_E2EE=ON

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm 644 "libQuotient-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
