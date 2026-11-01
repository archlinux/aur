# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: ConfuZzled <theconfuzzleddude@gmail.com>

pkgname=lunar-magic
pkgver=3.71
_pkgver=371
pkgrel=1
pkgdesc='Level editor for Super Mario World'
url='https://fusoya.eludevisibility.org/lm/index.html'
arch=('i686' 'x86_64')
license=('LicenseRef-custom')
depends=('sh' 'wine')

source=(
  "https://fusoya.eludevisibility.org/lm/download/lm${_pkgver}.zip"
  "${pkgname}"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
noextract=("lm${_pkgver}.zip")
sha256sums=('a16725f0c15868d4f42a26e49e2e366d82612ef7161df9d4fb4388fcbb3029b8'
            'f7384d03dd4eee0f2c2528d33c95e3d9bbde2b7a98c542531cf34e5f11bf87bf'
            '33fa325303281102f1fa875053ea84ef50d2adff510d7a17efc9c2df72975efa'
            '91317fb39eb5f92dbc11e74bb2179832e8f254c40ecabb16c11cbf0fddd45fad')

package() {
	install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    bsdtar -xf "lm${_pkgver}.zip" -C "${pkgdir}/usr/share/${pkgname}"

	# extract license from readme
	sed -n '/The Lunar Magic Mario/,/ use or presence./p' "${pkgdir}/usr/share/${pkgname}/readme.txt" >> 'LICENSE'
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
	find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
}

