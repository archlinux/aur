# Maintainer: hashworks <mail@hashworks.net>
pkgname=zim-tools
pkgver=1.2.1
pkgrel=2
pkgdesc="Various ZIM command line tools"
license=('GPL3')
arch=('x86_64')
depends=('libzim>=6.1.5')
makedepends=('meson')
url='https://github.com/openzim/zim-tools'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(622ed1ff471d621a39a12f2d5d9996f71c59c29fcde2db98b8897d2e2d266991)

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
