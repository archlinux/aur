# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=okuna-desktop
_pkgver=0.0.51-1
pkgname="${_pkgname}-bin"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Desktop client for Okuna"
arch=('x86_64')
url="https://gitlab.com/999eagle/okuna-desktop"
license=('AGPL3')
provides=("${_pkgname}" "openspace-desktop" "openbook-desktop")
conflicts=("${_pkgname}" "openspace-desktop-bin" "openbook-desktop-bin")
replaces=('openspace-desktop-bin' 'openbook-desktop-bin')
depends=('libxcursor' 'libxinerama' 'libxrandr' 'libxxf86vm' 'sqlite' 'bash' 'gtk3' 'openssl')
source=("${_pkgname}-${_pkgver}.zip::https://gitlab.com/999eagle/okuna-desktop/-/jobs/artifacts/${_pkgver}/download?job=release-linux")
sha256sums=('813d07c9fc2bff6cf5beaddb6ddee32175a562d0ddc5ef5025018f69ffa0b49e')

package() {
	# Main files
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/opt/${_pkgname}"

	# Binary symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
	rm "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"

	# Icons
	for size in 32 64 256; do
		path="${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		install -d "${path}"
		ln -s "/opt/${_pkgname}/assets/okuna-o-logo_transparent_${size}.png" "${path}/${_pkgname}.png"
	done
}

