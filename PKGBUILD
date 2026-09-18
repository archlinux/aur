# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=navop-bin
_pkgname=Navop
pkgver=0.18.1
pkgrel=1
pkgdesc="A native, all-in-one workspace for databases, SSH, SFTP, terminals, remote desktop, monitoring, and AI."
arch=(
    'aarch64'
    'x86_64'
)
url="https://navop.dev/"
_ghurl="https://github.com/feigeCode/navop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxkbcommon-x11'
    'libxcb'
    'systemd-libs'
    'gtk3'
    'webkit2gtk-4.1'
    'libappindicator'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.gz")
sha256sums_aarch64=('94d48417eec5a53640dd42813326c8498a5040c817dae05efa367b89958f6969')
sha256sums_x86_64=('39024709d8f57bd5eae1d88b21af81055b525d02c08e2abd7f1fe2be3b5eacde')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
}
