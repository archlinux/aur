# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Specter119 <spcter119 AT gmail.com>
# Contributor: Berturion@free.fr>
pkgname=switchhosts-bin
_pkgname=SwitchHosts
pkgver=5.0.2
pkgrel=1
pkgdesc='Switch hosts quickly!(Prebuilt version)'
arch=(
    'aarch64'
    'x86_64'
)
url="https://switchhosts.app/"
_ghurl="https://github.com/oldj/SwitchHosts"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums_aarch64=('817bfa64932f42f8a376cd2a0c63fbc8e8b14a3b2cbe892371e1f64937f90498')
sha256sums_x86_64=('4f4cd60d7dfa6165047ad1ceb7e5af1facc3ca181afeb15be4f96be207bb2846')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
