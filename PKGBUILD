# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onetcli-bin
_pkgname=OnetCli
pkgver=0.4.0
pkgrel=1
pkgdesc="One Net Client — A cross-platform desktop client for databases, SSH/SFTP, terminals & AI, all in one place. (Prebuilt version)"
arch=('x86_64')
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
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('26e6b06efb12ff9124f5f926f642a215042ef540090f550f78354f0466aefd69')
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
