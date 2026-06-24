# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=donutbrowser-bin
_pkgname=Donut
pkgver=0.27.1
pkgrel=1
pkgdesc="A powerful browser orchestrator that puts you in control of your browsing experience. 🍩(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://donutbrowser.com/"
_ghurl="https://github.com/zhom/donutbrowser"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'xdotool'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('57cdaf4457f971e15afd0129c11372759e62f6deda02936daebcc70b0d6a03e8')
sha256sums_x86_64=('d13a4eca24a6d01889a3dc95f55a8d7a5d2224a85b926d431283a60f3c2c96b4')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/libxdo.so.4" "${pkgdir}/usr/lib/libxdo.so.3"
    find "${srcdir}/usr/share/icons" -type f \( -name "*.png" -o -name "*.svg" \) \
        | while read -r _i; do
        _extension="${_i##*.}"
        _target_dir=$(dirname "${_i#$srcdir}")
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
