# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=ultrakiss
pkgver=4.2
pkgrel=1
pkgdesc="Full featured IDE for creating, editing and viewing online KiSS sets"
arch=('any')
url="https://github.com/kisekae/UltraKiss"
license=('GPL-3.0')
groups=('ultrakiss')
depends=('java-runtime=17' 'hicolor-icon-theme' 'jre17-openjdk')
makedepends=('java-environment=17')
source=("$pkgname-$pkgver.sh::https://github.com/kisekae/${pkgname}/releases/download/V${pkgver}/${pkgname}_unix_${pkgver//./_}.sh"
		"ultrakiss.desktop")
md5sums=('b44378910dcd256374ee4117276b1916'
         '56412a57be924d961c2bc053d2a57353')
sha256sums=('6673304c75703ea607eff995d775b198dfac4c4d204a0e7f4a134dfca77213a1'
            '443d64cda97901bd96fd68af7a7ae15a41574c77827d726656a0a837138f2617')

package() {
	sh "${srcdir}/${pkgname}-${pkgver}.sh" -q \
		-dir "${pkgdir}/opt/${pkgname}"\
        -destination "${pkgdir}/opt/${pkgname}" \
        -overwrite

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/UltraKiss_${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

	install -d "${pkgdir}/usr/share/pixmaps"
	cp "${pkgdir}/opt/${pkgname}/.install4j/UltraKiss_${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
