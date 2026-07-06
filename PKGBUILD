# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onetcli-bin
_pkgname=OnetCli
pkgver=0.8.0
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
    'gtk3'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('6c52da07f5669eea76ec3ade01415d9ec0a9d51410a29e81b00c0f488fa6b8fb')
sha256sums_x86_64=('db2557a4d492b5d84f9001f3853f3dde9ef3ea5a7def0c9428b2b322ac404226')
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
