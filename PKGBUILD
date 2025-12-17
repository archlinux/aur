# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=bibisco-ce
_pkgname=bibisco
pkgver=4.0.1
pkgrel=1
pkgdesc='Novel writing software for authors'
arch=('x86_64')
url='https://bibisco.com'
license=('MIT')
conflicts=('bibisco')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'gtk3'
	'libcups'
	'nodejs'
	'nspr'
	'nss'
	'pango'
)
source=(
	# Download the zip file and place in the same directory as this file.
	"local://bibisco-linux-x64-${pkgver}-CE.zip"
	${_pkgname}.desktop
)
sha256sums=(
	'd0730f60d2420f8c3f32507439e12990bc22331bca1a0ba7c000907a3ae942c3'
	'c67436460914778542cb8bf82b77ebbc0b3860fa68ff64efdf50a76af7aa2f14'
)
package()
{
	_unpacked_dirname="bibisco-linux-x64-${pkgver}-CE"

	# data
	install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
	chmod 755 "${srcdir}/${_unpacked_dirname}" # Fix incorrect permissions
	cp -aT "${srcdir}/${_unpacked_dirname}" "${pkgdir}/opt/${pkgname}"
	ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# desktop integration
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/${pkgname}/resources/app/assets/icons/linux/bibisco-circle-hr.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	# legal
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_unpacked_dirname}/LICENSE" "${srcdir}/${_unpacked_dirname}/LICENSES.chromium.html"
}
