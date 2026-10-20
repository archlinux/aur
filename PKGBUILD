# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=techdoro-bin
_pkgname=Techdoro
_debname=com.zelchi.techdoro
pkgver=4.0.4
pkgrel=1
pkgdesc="A desktop Pomodoro timer with a to-do list."
arch=('x86_64')
url="https://github.com/Zelchi/techdoro"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libxkbcommon-x11'
    'libxcb'
    'libgcc'
    'libxkbcommon'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Zelchi/techdoro/v${pkgver}/LICENSE"
)
sha256sums=('a063383df9d522b2a048eaebfc2be4d7dee86ae7be6bd5efc3290a7ed84fd25c'
            'a73b41d88cfe4bee23d9346f42a139fc66c97370432ed4fbcd1ae5b6b1ad7127')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
