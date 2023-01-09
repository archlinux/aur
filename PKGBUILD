# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libquotient-encryption
pkgver=0.7.0
pkgrel=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64 aarch64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia" "qtkeychain-qt5" "libolm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("${pkgname}.tar.gz::https://github.com/quotient-im/libQuotient/archive/refs/tags/0.7.0.tar.gz")
sha512sums=("6770e3caa6198a77fc33bf7edd2a34d5673e01474b639aa020af989046ff04c44ff5ce26b6418ae31fcca49cc54a147052153ed5c60706f26c177ebd57d452c5")

prepare() {
	mkdir -p "build"
}

build() {
	cd "build"
	cmake ../"libQuotient-0.7.0" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_SHARED_LIBS=1 \
	-DQuotient_ENABLE_E2EE=ON

	make
}

package() {
	cd "build"
	make DESTDIR="${pkgdir}" install

	cd "../libQuotient-0.7.0"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
