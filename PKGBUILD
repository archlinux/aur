# Maintainer: BrainDamage <>

pkgname=konfyt
pkgver=1.3.1
pkgrel=1
pkgdesc="is a digital keyboard workstation for Linux to set up patches with multiple layers, and switch for live playing."
arch=('x86_64')
url='http://www.noedig.co.za/konfyt'
license=('GPL3')
depends=('fluidsynth' 'carla' 'liblscp' 'qt5-base' 'linuxsampler')
source=("https://github.com/noedigcode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f0156590e0d2f88d7ea83c7b4bb7e2ab12cefc118d4acc18dce02c82e4d72ab2')

# template start; name=qmake; version=1;
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

# template start; name=make_install; version=1;
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 "desktopentry/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "desktopentry/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/${pkgname}.png"
}
