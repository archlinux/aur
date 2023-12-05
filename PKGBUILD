# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: ConfuZzled <theconfuzzleddude@gmail.com>
pkgname=lunar-magic
pkgver=3.40
_pkgver=340
pkgrel=1
pkgdesc='Level editor for Super Mario World'
url='https://fusoya.eludevisibility.org/lm/index.html'
arch=('i686' 'x86_64')
depends=('wine')
makedepends=('unzip')
source=("https://fusoya.eludevisibility.org/lm/download/lm${_pkgver}.zip"
		"${pkgname}"
		"${pkgname}.desktop"
		"${pkgname}.png")
noextract=("lm${_pkgver}.zip")
sha256sums=('dad912e021fc81853709e3a7f75b5b843409b8d1816043ea594f280b60ea087a'
            'c1f2ef084107f4947b008bc6fbd6da820b48568a20229ebaaaf5834e31b4ce89'
            '33fa325303281102f1fa875053ea84ef50d2adff510d7a17efc9c2df72975efa'
            '91317fb39eb5f92dbc11e74bb2179832e8f254c40ecabb16c11cbf0fddd45fad')
license=('custom')

package() {
	install -d -m755 "${pkgdir}/usr/share/${pkgname}"
	unzip "lm${_pkgver}.zip" -d "${pkgdir}/usr/share/${pkgname}"

	# extract license from readme
	sed -n '/The Lunar Magic Mario/,/ use or presence./p' "${pkgdir}/usr/share/${pkgname}/readme.txt" >> 'LICENSE'
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
	find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
}
