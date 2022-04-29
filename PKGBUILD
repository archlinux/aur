# Maintainer: dplusplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname='heros-hour'
pkgname="${_pkgname}-gog"
pkgver=2.1.0
_pkgverbuild=55257
pkgrel=1

arch=('x86_64')
license=(custom)
groups=('games' 'gog')

pkgdesc='Fantasy-themed, hybrid turn-based and real-time Strategy Role-Playing Game'
url='https://www.gog.com/game/heros_hour'

depends=(
	'wine'
)
makedepends=(
	'innoextract'
)
optdepends=(
	'firejail: sandboxing'
)

_pkgsetup="setup_heros_hour_${pkgver}_(${_pkgverbuild}).exe"
source=(
	"gog://${_pkgsetup}"
	"${pkgname}"
	"${pkgname}.profile"
	"${pkgname}.desktop"
)

sha512sums=(
	'2f3c85494416e16dd5b833be144bab5171bb5168dfa0554341e8d1a1e7f9a83b36a047fd800b92215b33c0766390334d1f3e6b4dda259ce3806df740cef8faee'
	'SKIP'
	'SKIP'
	'SKIP'
)

options=('!strip')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL. Download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

build() {
	innoextract --exclude-temp --output-dir 'game' "${_pkgsetup}"
}

package() {
	local _pkginstalldir="${pkgdir}/opt/${pkgname}"

	install -d "${_pkginstalldir}"
	cp -r "game/." "${_pkginstalldir}/"

	install -d "${pkgdir}/usr/bin"
	install -D -m 555 "${pkgname}" "${pkgdir}/usr/bin"

	install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -D -m 644 "${pkgname}.profile" "${pkgdir}/etc/firejail/${pkgname}.profile"
}
