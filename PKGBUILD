# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tess-bin
_pkgname=Tess
pkgver=0.7.0_alpha.13
pkgrel=1
pkgdesc="A hackable, simple, rapid and beautiful terminal for the new era of technology.(Prebuilt version)"
arch=(
    'i686'
    'x86_64'
)
url="https://tessapp.dev/discord"
_ghurl="https://github.com/Squitch1/Tess"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}-1_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}-1_amd64.deb")
sha256sums_i686=('a0cb1a9fdb0fc3593f157b032af137bd984c706eb3c519ae0e8146d37b8d41bd')
sha256sums_x86_64=('1cf5b33fa3d2d0115e95773d01488967065fa8470bcb8cc677a3c0b36a1c3405')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}"*.png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/kio/servicemenus/open-in-${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/kio/servicemenus"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}