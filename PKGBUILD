# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=openbook-desktop
_pkgver=0.0.41
pkgname="${_pkgname}-bin"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Desktop client for Openbook"
arch=('x86_64')
url="https://gitlab.com/999eagle/openbook-desktop"
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libxcursor' 'libxinerama' 'libxrandr' 'libxxf86vm' 'sqlite' 'bash' 'gtk3')
source=("${_pkgname}-${_pkgver}.zip::https://gitlab.com/999eagle/openbook-desktop/-/jobs/artifacts/${_pkgver}/download?job=release-linux")
sha256sums=('42fa7d06c287b0ca6ab3b8be6af4c076f9ea7d544a1ae28b2897e1eb16ec3b3c')

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
		ln -s "/opt/${_pkgname}/assets/openbook-o-logo_transparent_${size}.png" "${path}/${_pkgname}.png"
	done
}

