# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=container-desktop-bin
_pkgname='Container Desktop'
pkgver=6.0.0
pkgrel=1
pkgdesc="Podman desktop companion.A familiar desktop graphical interface to the free and open container manager, podman!(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://iongion.github.io/container-desktop/"
_ghurl="https://github.com/iongion/container-desktop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    'podman'
    'docker'
    'gtk3'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.pacman")
sha256sums_aarch64=('c28c8f1167871bbb921df92515bdd8404f7ad4b5d93196a2bce1387e0c81902f')
sha256sums_x86_64=('044ae42a10fae9635d919bbddd859bd4a71bacbfc56f0e35b1435a62f01179c0')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
