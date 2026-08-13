# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=termua-bin
_pkgname=Termua
pkgver=0.1.4
pkgrel=1
pkgdesc="An open-source cross-platform terminal application built with GPUI and powered by the Alacritty / WezTerm terminal backends.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/iamazy/termua"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.x86_64.rpm")
sha256sums_aarch64=('83682dc071a10c8f146b6474de1d167cdedaf0e904ed159fe831554cb3df5afc')
sha256sums_x86_64=('d83719f88460505ead4feb553d2ddff039d6c03ccb3c454589dce0a8b234f682')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}"* -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
