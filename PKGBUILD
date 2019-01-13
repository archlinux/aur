# Maintainer: basigur

pkgname=qcalcfilehash
pkgver=1.0.3
pkgrel=2
pkgdesc="Calculator hash (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8)"
arch=('x86_64')
url="https://bitbucket.org/admsasha/qcalcfilehash"
license=('custom')
depends=('qt5-base' 'openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
replaces=('qcalcfilehash')
makedepends=('qt5-tools' 'icoutils')
conflicts=()
source=("https://bitbucket.org/admsasha/qcalcfilehash/downloads/QCalcFileHash_v"${pkgver}".tar.gz")

sha512sums=('0f3016530dae4529b318b0174046507b3d90f922e12025fc66c9ee80638678586575736f4c67a2f6259692a47e516f8b88519407a650fee6489e0b0bd125b1e6')

build() {
	tar -xzf QCalcFileHash_v"${pkgver}".tar.gz
	cd "${srcdir}/QCalcFileHash"
	qmake
	lupdate ./QCalcFileHash.pro
	lrelease ./QCalcFileHash.pro
	make

	icotool -x QCalcFileHash.ico

	echo "[Desktop Entry]" >> "${pkgname}".desktop
	echo "Name=QCalcFileHash" >> "${pkgname}".desktop
	echo "Comment=Hash calculator" >> "${pkgname}".desktop
	echo "Type=Application" >> "${pkgname}".desktop
	echo "Exec=qcalcfilehash" >> "${pkgname}".desktop
	echo "Icon=qcalcfilehash" >> "${pkgname}".desktop
	echo "Categories=Utility;Qt;" >> "${pkgname}".desktop

}

package(){

	cd "${srcdir}/QCalcFileHash"
	install -D -m644 "${srcdir}/QCalcFileHash/${pkgname}.desktop" "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	install -d "${pkgdir}/usr/share/qcalcfilehash"
	cp -r *.qm "${pkgdir}"/usr/share/qcalcfilehash/
	install -D -m644 "${srcdir}/QCalcFileHash/README.md" "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
	install -D -m644 "${srcdir}/QCalcFileHash/QCalcFileHash_2_32x32x32.png" "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/"${pkgname}".png
	install -D -m644 "${srcdir}/QCalcFileHash/QCalcFileHash_1_16x16x32.png" "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/"${pkgname}".png
	install -D -m755 "${srcdir}/QCalcFileHash/Bin/qcalcfilehash" "${pkgdir}"/usr/bin/"${pkgname}"

}
