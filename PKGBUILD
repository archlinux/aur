# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=navop-bin
_pkgname=Navop
pkgver=0.9.7
pkgrel=1
pkgdesc="Navop combines Navigate and Operation—a unified workspace that helps developers navigate and operate databases, servers, terminals, and AI tools from one place. (Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/feigeCode/navop"
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
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('e2b4c80af8a0d49903fb68b1d51525f0100a4601fbef9e3b8204dec9c7ac142a')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
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
