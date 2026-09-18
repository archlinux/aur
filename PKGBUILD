# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=techdoro-bin
_pkgname=Techdoro
pkgver=3.0.1
pkgrel=1
pkgdesc="A desktop Pomodoro timer with a to-do list."
arch=('x86_64')
url="https://github.com/Zelchi/techdoro"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('02d60f5744edbf469917195d612933c9a56510325285a6c78fd21e7327d1ef8c')
prepare() {
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
