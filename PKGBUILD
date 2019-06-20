# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=openspace-desktop
_pkgver=0.0.44-1
pkgname="${_pkgname}-bin"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Desktop client for Openspace"
arch=('x86_64')
url="https://gitlab.com/999eagle/openspace-desktop"
license=('AGPL3')
provides=("${_pkgname}" "openbook-desktop")
conflicts=("${_pkgname}" "openbook-desktop-bin")
replaces=('openbook-desktop-bin')
depends=('libxcursor' 'libxinerama' 'libxrandr' 'libxxf86vm' 'sqlite' 'bash' 'gtk3')
source=("${_pkgname}-${_pkgver}.zip::https://gitlab.com/999eagle/openspace-desktop/-/jobs/artifacts/${_pkgver}/download?job=release-linux")
sha256sums=('e16a344200df1e09ac5d7ed64cf817678d68dc59d283cd88ac876826f5744d79')

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
		ln -s "/opt/${_pkgname}/assets/openspace-o-logo_transparent_${size}.png" "${path}/${_pkgname}.png"
	done
}

