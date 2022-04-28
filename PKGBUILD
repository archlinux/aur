# Maintainer: dplusplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname='heros-hour'
pkgname="${_pkgname}-gog"
pkgver=2.0.5
_pkgverbuild=54206
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
	'b6c1422ff192f42519789a6832fab2b0a545b243902d1ea998a7c9000ff2e5a0cf38ed7dcc8497e26683bbb547efdaf43b957fd338acdb68f2bfdf2f7a9ee2e0'
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
