# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ucm-desktop-bin
_pkgname='UCM Desktop'
pkgver=1.1.0
pkgrel=1
pkgdesc="A desktop app companion to the UCM CLI.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://unison-lang.org/"
_ghurl="https://github.com/unisonweb/ucm-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ucm-bin'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/unisonweb/ucm-desktop/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('1a6dcace03c9ae60da5594e77bff3207de150a7e1b257b43f3ba53b21a6b2b3a')
sha256sums_aarch64=('0fc87c2ea4d2309610228f9eafbd338a96ac982aad4f8f515089977b44dd71fc')
sha256sums_x86_64=('891c01f60a82c2a974a7807831f9915fab5640be967b70be741463bc7ba5cecd')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}