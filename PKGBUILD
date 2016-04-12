# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=colorific-7.0-tb+fx
pkgname=firefox-extension-colorific
pkgver=7.0
pkgrel=1
pkgdesc="Plugin for firefox that allows you to colorize all websites to your own preferences."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/colorific-1/"
depends=("firefox")
makedepends=("unzip")
source=("https://addons.cdn.mozilla.net/user-media/addons/386335/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('53463f7e8b0b553a36e9ee6eed70c30f6767c8123d40221b5207fbc2bdb40389')

prepare() {
	cd "$srcdir"

	unzip -qqo "${_pkgname}.xpi" -d "${_pkgname}"
}

package() {
	cd "${srcdir}"

	#_extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}/install.rdf)"
	_extension_id='colorific@pjs.nl'
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	# Should this extension be unpacked or not?
	if grep '<em:unpack>true</em:unpack>' ${_pkgname}/install.rdf > /dev/null; then
		install -dm755 "${_extension_dest}"
		cp -R ${_pkgname}/* "${_extension_dest}"
		chmod -R ugo+rX "${_extension_dest}"
	else
		install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
	fi
}
