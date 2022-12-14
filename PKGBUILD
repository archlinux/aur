# Maintainer: Khorne <khorne@khorne.me>

pkgname=escribe-suite-bin
pkgver=2_SP50
pkgrel=1
pkgdesc="Evolv eScribe Suite - DNA Management Suite and Ecigstats - INTL Version"
arch=('x86_64')
url="https://forum.evolvapor.com/topic/69197-linux-escribe-suite-beta-thread/"
license=('custom')
depends=('gtk2' 'mono' 'gtk-sharp-2')
makedepends=('unzip')
optdepends=('hardinfo: For system information utility')
source=("https://downloads.evolvapor.com/SetupEScribe${pkgver//./_}_INT.run"
        "escribe-suite-bin.sh"
        "escribe-suite-bin.desktop"
        "ecigstats.desktop")
md5sums=('cd2c663a0a25e3724ec4ee1e3258030a'
         '53880780578d5bed155dbdf19d56fc21'
         'df3dd8faa3a84bdbec2f73b8432d058b'
         'ac196ccd2f6a532056b7f4e5c52f91de')
prepare() {
	chmod +x "SetupEScribe${pkgver//./_}_INT.run"
	./"SetupEScribe${pkgver//./_}_INT.run" --target . --noexec
	cd common/data
	unzip -o escribe-suite.zip -d main/
        unzip -o ecigstats.zip -d components/
        rm -f *.zip
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r common/data/* "${pkgdir}/opt/${pkgname}"
	install -D -m644 "common/data/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "ecigstats.desktop" "${pkgdir}/usr/share/applications/ecigstats.desktop"
	install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/escribe-suite"
}
