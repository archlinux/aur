# Maintainer: Chris G <aur@szlig.net>
pkgname=openterface_qt
_pkgname=Openterface_QT
pkgver=0.3.19
pkgrel=1
pkgdesc="Openterface Mini-KVM Host Application"
arch=('x86_64')
url="https://openterface.com/"
license=('AGPL-3.0-only')
depends=(qt6-base qt6-multimedia qt6-serialport qt6-svg qt6-multimedia-ffmpeg hicolor-icon-theme libusb)
makedepends=(qt6-tools clang)
install="openterfaceQT.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TechxArtisanStudio/Openterface_QT/archive/${pkgver}.tar.gz"
        "openterfaceQT.desktop")
sha256sums=('f7c1ba0d959883dcb7e7ec0ada639f9b20a4b60b60a92636d2ab6a487db14b7b'
            '48d2a22fb5816c9bd7aa7641eb1a4d127effee888a823ce9dcc972b24741cce7')


build() {
	cd "$srcdir/$_pkgname-$pkgver"

	/usr/lib/qt6/bin/lrelease openterfaceQT.pro

	mkdir build && cd build
	qmake6 ..	
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
