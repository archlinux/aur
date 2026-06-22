# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onetcli-bin
_pkgname=OnetCli
pkgver=0.6.5
pkgrel=1
pkgdesc="One Net Client — A cross-platform desktop client for databases, SSH/SFTP, terminals & AI, all in one place. (Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://feigecode.github.io/onetcli/"
_ghurl="https://github.com/feigeCode/onetcli"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxkbcommon-x11'
    'libxcb'
    'systemd-libs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('94401ded16237e263aa4d084b5e09e876343afd84725f7649de3cad83f93c1bb')
sha256sums_x86_64=('0c01d5642e3746e0c905021813cf29e66a7f85f4bee635f5b43fe4d035ad4e16')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
