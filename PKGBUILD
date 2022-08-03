# Maintainer: dplusplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname='heros-hour'
pkgname="${_pkgname}-gog"
pkgver=2.2.3
_pkgverbuild=57420
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
	'417ea404a1535db01f6b802babd342502c5e0932199fb3590d1ec126421db276a35c674661efa13b2e0feccbdd69c3928c6a877874a863ce6abb9d0b1748f98d'
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
