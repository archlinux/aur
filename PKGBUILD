# Maintainer: Benjamin Stürz <stuerzbenni@gmail.com>
pkgname=cmdcalc
pkgver=2.1
pkgrel=2
pkgdesc="A simple command-line calculator"
arch=(x86_64 i686)
url="https://github.com/Benni3D/cmdcalc"
license=('GPL3')
depends=('readline>=8')
makedepends=('cmake')
source=('https://github.com/Benni3D/cmdcalc/archive/v2.1.tar.gz')
md5sums=('08716498b365425c36aec8f8982722d5')

prepare() {
	install -dm 755 "${pkgname}-${pkgver}/build"
}

build() {
	cd "${pkgname}-${pkgver}/build"
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm 755 "${pkgdir}/usr/bin"
	install -Dm 755 "build/cmdcalc2" "${pkgdir}/usr/bin/cmdcalc"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
