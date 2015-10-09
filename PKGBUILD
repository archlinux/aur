# Maintainer: Per Magnus Auby <permagnus@gmail.com>

pkgname=brainfpv
pkgver=20150928
pkgrel=1
pkgdesc="Ground control station and firmware for BrainFPV flight controller"
url="https://github.com/BrainFPV/TauLabs"
arch=('i686' 'x86_64')
license=('GPL3' 'CCPL:sa')
depends=()
source=("https://github.com/BrainFPV/TauLabs/releases/download/Brain-${pkgver//_/-}/Brain-${pkgver//_/-}_linux_x86.tar.gz" "brainfpv.desktop" "brainfpv.png")
md5sums=('0a1c6a235757e6466e1b7110b89dc37f'
         'e1ef1df6a257211fe11c06c7c3dd2e87'
         '21b01c08ddde3f0d9f056b9eca4ab67a')

package() {
	cd ${srcdir}/Brain-${pkgver//_/-}_linux_x86

	install -d ${pkgdir}/opt/brainfpv
	cp -r gcs flight ${pkgdir}/opt/brainfpv/
	
	# Replace plugdev group with uucp.
	sed -i -e 's/"plugdev"/"uucp"/g' udev/rules.d/45-taulabs.rules
	install -Dm644 udev/rules.d/45-taulabs.rules ${pkgdir}/etc/udev/rules.d/45-brainfpv.rules

	install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/brainfpv/LICENSE.txt

	install -D ${srcdir}/brainfpv.desktop ${pkgdir}/usr/share/applications/brainfpv.desktop
	install -D ${srcdir}/brainfpv.png ${pkgdir}/usr/share/brainfpv/brainfpv.png
}
