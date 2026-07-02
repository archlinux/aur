# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onetcli-bin
_pkgname=OnetCli
pkgver=0.7.2
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
sha256sums_aarch64=('2c268672161e7b4fb6f32bfc6fd43289a57c97c47338a3d57f0a0f368f567706')
sha256sums_x86_64=('14e286fdc480b12509d0241572546202b8fc81c949b0940cb518a86e14cb49a3')
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
