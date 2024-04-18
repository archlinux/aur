# Maintainer: BrainDamage <>

pkgname=konfyt
pkgver=1.6.1
pkgrel=1
pkgdesc="is a digital keyboard workstation for Linux to set up patches with multiple layers, and switch for live playing."
arch=('x86_64')
url='http://www.noedig.co.za/konfyt'
license=('GPL3')
depends=('fluidsynth' 'carla' 'liblscp' 'qt5-base' 'linuxsampler')
source=("https://github.com/noedigcode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5013f1743c887a2c2d834e3cf4abbb216a2f03f62775cc3739a82d6d9ad75333')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 "desktopentry/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "desktopentry/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/${pkgname}.png"
}
