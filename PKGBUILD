# Maintainer: Chris G <aur@szlig.net>
pkgname=openterface_qt
_pkgname=Openterface_QT
pkgver=0.0.4
pkgrel=1
pkgdesc="Openterface Mini-KVM Host Application"
arch=('x86_64')
url="https://openterface.com/"
license=('AGPL-3.0-only')
depends=(qt6-base qt6-multimedia qt6-serialport qt6-svg qt6-multimedia-ffmpeg hicolor-icon-theme)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TechxArtisanStudio/Openterface_QT/archive/${pkgver}.tar.gz"
        "openterfaceQT.desktop")
sha256sums=('aada24cb0e8e81c55b8bf3bcf2319ce7f8516f8911c9cf08f301340efd87cf3e'
            '48d2a22fb5816c9bd7aa7641eb1a4d127effee888a823ce9dcc972b24741cce7')


prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir build && cd build
	qmake6 ..	
}

build() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	install -Dm755 "./openterfaceQT" "${pkgdir}/usr/bin/openterfaceQT"
	install -Dm644 "${srcdir}/openterfaceQT.desktop" "${pkgdir}/usr/share/applications/openterfaceQT.desktop"
	install -Dm644 "../images/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openterfaceQT.png"
	install -Dm644 "../images/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/openterfaceQT.png"
	install -Dm644 "../images/icon_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openterfaceQT.png"

}
