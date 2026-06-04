# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-irc-client-bin
_pkgname=Simple-Irc-Client
pkgver=2.0.2
pkgrel=1
pkgdesc="💻 Desktop clients for Simple Irc Client.(Prebuilt version)"
arch=('x86_64')
url="https://simpleircclient.com/"
_ghurl="https://github.com/Simple-Irc-Client/desktop"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('9f09686e5dc4c617c81a33a94b1ca0f91f82f2c3c02020c26b88522d30c6435e')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
