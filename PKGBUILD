# Based on helium-browser-bin (https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=helium-browser-bin)

_pkgname=line-gtk
pkgname="${_pkgname}"
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial native LINE client for Linux. GTK4 / Libadwaita UI with a Deno protocol sidecar (linejs) - Prebuilt binary"
arch=('x86_64')
url="https://github.com/MidnightTale/Line-GTK"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'deno' 'ffmpeg')
optdepends=('poppler: PDF preview support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${pkgname}-${pkgver}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}_linux.tar.gz")
sha256sums_x86_64=('f76ef62ab381931081f50f8ca8f13bc1cf27d3cd38b46d29b0c6fd7dd2dfa800')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${arch}_linux"

	# Install executable binary
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Install desktop entry
	install -Dm644 "dev.linegtk.LineGtk.desktop" "${pkgdir}/usr/share/applications/dev.linegtk.LineGtk.desktop"

	# Install application icons
	if [[ -d "assets/icons/hicolor" ]]; then
		cp -dr --no-preserve=ownership "assets/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
	elif [[ -d "assets/icons" ]]; then
		cp -dr --no-preserve=ownership "assets/icons/"* "${pkgdir}/usr/share/icons/hicolor/"
	fi
}