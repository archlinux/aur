# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=navop-bin
_pkgname=Navop
pkgver=0.24.2
pkgrel=1
pkgdesc="A native, all-in-one workspace for databases, SSH, SFTP, terminals, remote desktop, monitoring, and AI."
arch=(
	'aarch64'
	'x86_64'
)
url="https://navop.dev/"
_ghurl="https://github.com/feigeCode/navop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'libxkbcommon-x11'
	'libxcb'
	'systemd-libs'
	'libappindicator'
	'libayatana-appindicator'
)
makedepends=(
	'imagemagick'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.gz")
sha256sums_aarch64=('1a3d9b7cd9b373b2c3064cec5b31d9bf7097bce255831ae43323fd7980caab86')
sha256sums_x86_64=('6a91d860d21aecd5685067d08807b94d97b3ebc81605fe69c037b06460fd74d7')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512) _src="${srcdir}/usr/share/icons/hicolor/512x515/apps/${pkgname%-bin}.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-bin}.png"
	done
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	_generate_icons
	install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
}