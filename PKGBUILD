# Maintainer: Chris G <aur@szlig.net>
pkgname=openterface_qt-git
_pkgname="${pkgname%-git}"
_reponame=Openterface_QT
pkgver=0.3.1.r1.gcac5ee1
pkgrel=1
pkgdesc="Openterface Mini-KVM Host Application"
arch=('x86_64')
url="https://openterface.com/"
license=('AGPL-3.0-only')
depends=(qt6-base qt6-multimedia qt6-serialport qt6-svg qt6-multimedia-ffmpeg hicolor-icon-theme libusb)
makedepends=(git qt6-tools clang)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/TechxArtisanStudio/Openterface_QT.git"
        "openterfaceQT.desktop")
sha256sums=('SKIP'
            '48d2a22fb5816c9bd7aa7641eb1a4d127effee888a823ce9dcc972b24741cce7')

pkgver() {
	cd "${_reponame}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_reponame}"

	/usr/lib/qt6/bin/lrelease openterfaceQT.pro

	mkdir build && cd build
	qmake6 ..	
	make
}

package() {
	cd "${_reponame}/build"
	install -Dm755 "./openterfaceQT" "${pkgdir}/usr/bin/openterfaceQT"
	install -Dm644 "${srcdir}/openterfaceQT.desktop" "${pkgdir}/usr/share/applications/openterfaceQT.desktop"
	install -Dm644 "../images/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openterfaceQT.png"
	install -Dm644 "../images/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/openterfaceQT.png"
	install -Dm644 "../images/icon_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openterfaceQT.png"

}
