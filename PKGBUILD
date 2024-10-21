# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop-bin
_pkgname=NVM.Desktop
pkgver=4.0.2
pkgrel=1
pkgdesc="Node Version Manager Desktop - A desktop application to manage multiple active node.js versions.Prebuilt version."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/1111mp/nvm-desktop/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('67fae9ba39c4a7c4af6bc4c4e25e72b6e8786f064f79107e534e5d8cff2c10c2')
sha256sums_aarch64=('f68ef656c0824de125e630d7a1cab736ef6d514922c66a54caf6fde71782b2c5')
sha256sums_x86_64=('f4b9f0d23d65e4aa74ee731a6a92311eab61d540f5699dd5d0b1dc907efc743f')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/lib/${_pkgname//./ }/resources/nvmd" -t "${pkgdir}/usr/lib/${_pkgname//./ }/resources"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname//./ }/icons/icon.png" -t "${pkgdir}/usr/lib/${_pkgname//./ }/icons"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}