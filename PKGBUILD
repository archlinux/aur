# Maintainer: Khorne <khorne@khorne.me>

pkgname=escribe-suite-bin
pkgver=2_SP15.1
pkgrel=2
pkgdesc="Evolv eScribe Suite - DNA Management Suite and Ecigstats - INTL Version"
arch=('x86_64')
url="https://forum.evolvapor.com/topic/69197-linux-escribe-suite-beta-thread/"
license=('custom')
depends=('gtk2' 'mono' 'gtk-sharp-2')
makedepends=('unzip')
source=("https://downloads.evolvapor.com/SetupEScribe${pkgver//./_}_INT.run"
        "escribe-suite-bin.sh"
        "escribe-suite-bin.desktop")
md5sums=('9b037ebf0d7268ef66509166e956a931'
         'ba5339f0ab83cd4ed4f5022f308b35ef'
         '62567c96bf5abe96690ed96ddca0f31a')

prepare() {
	chmod +x "SetupEScribe${pkgver//./_}_INT.run"
	./"SetupEScribe${pkgver//./_}_INT.run" --target . --noexec
	cd common/data
	unzip -o escribe-suite.zip
	rm -f *.zip
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r common/data/* "${pkgdir}/opt/${pkgname}"
	install -D -m644 "common/data/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/escribe-suite"
}
