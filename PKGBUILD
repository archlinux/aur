# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=risuai-bin
_pkgname=RisuAI
pkgver=2026.8.250
pkgrel=1
pkgdesc="Make your own story. User-friendly software for LLM roleplaying.(Prebuilt version)"
arch=('x86_64')
url="https://risuai.net/"
_ghurl="https://github.com/kwaroran/RisuAI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'python'
    'python-pydantic'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('3830dfd3b88cbcf8315315e8c091a7d7108c3d8f706f32b0ce05c7761a5d66d9')
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/lib"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
