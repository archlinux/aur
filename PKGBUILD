# Maintainer: Ákos Uzonyi <uzonyi.akos@gmail.com>
pkgname=circuit-simulator
pkgver=2.9.0
pkgrel=1
pkgdesc="Electronic circuit simulator written by Paul Falstad"
arch=("x86_64")
url="http://www.falstad.com/circuit"
license=("GPL")
depends=("libglvnd" "hicolor-icon-theme")
makedepends=("tar" "imagemagick")
source=("${pkgname}-${pkgver}.tgz::http://www.falstad.com/circuit/offline/circuitjs1-linux64.tgz" "http://www.falstad.com/circuit/favicon.ico" "circuit.desktop")
md5sums=("4df4e806174b131f465610a7fb4d6843" "062a9b61267bbef5e406a41b20a7d6a7" "deaff8b1646089d6c2c737dcbc540255")

package() {
	cd "$srcdir"

	OPT_DIR="$pkgdir/opt/$pkgname"
	mkdir -pm 755 "$OPT_DIR"
	tar -xf ${pkgname}-${pkgver}.tgz -C "$OPT_DIR"

	mkdir -pm 755 "${pkgdir}/usr/bin"
	ln -s /opt/circuit-simulator/circuitjs1/circuitjs1 "${pkgdir}/usr/bin/circuit-simulator"
	install -D -m644 "${srcdir}/circuit.desktop" "${pkgdir}/usr/share/applications/circuit.desktop"

	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	convert "favicon.ico" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/circuit.png"
}
