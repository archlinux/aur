# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=trovekit-bin
_pkgname=TroveKit
pkgver=1.0.0
pkgrel=1
pkgdesc="An open-source, lightweight, fully offline, cross-platform toolbox.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1595901624/TroveKit"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/1595901624/TroveKit/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('86d1a389dfd76a18037ccf9c2b8852a268f6b52e1400ccaf14f6bd1ee96c21b6')
sha256sums_aarch64=('811ccd0a0d86205528c377f2be2d63307ae2ca2f39f4a8f735acc88ecc3e3a9d')
sha256sums_x86_64=('34df41d9fe67f21a7ad65c68e55bb07549a81df317ffe0df7690e3917ab32388')
prepare() {
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
