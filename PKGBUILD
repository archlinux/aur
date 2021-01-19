# Maintainer: Benjamin Stürz <stuerzbenni@gmail.com>
pkgname=cmdcalc
pkgver=2.3
pkgrel=1
pkgdesc="A simple command-line calculator"
arch=(x86_64 i686)
url="https://github.com/Benni3D/cmdcalc"
license=('GPL3')
depends=('readline>=8')
makedepends=('cmake')
source=("https://github.com/Benni3D/cmdcalc/archive/v${pkgver}.tar.gz")
md5sums=('914be6a3df4357b20f04297f2fff595b')

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
