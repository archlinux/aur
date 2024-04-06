# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_pkgname=QtVsPlayer
pkgver=1.0.52_3
pkgrel=1
pkgdesc="Read local video files of Hikvision devices and display blue, green and red vectors."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL-3.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'freetype2'
    'util-linux-libs'
    'qt5-base'
    'libx11'
    'libglvnd'
    'openal'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.surf.mlo.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.surf.mlo.x86_64.rpm")
sha256sums=('b557fd5718a13641f40fbf227a9d6a2b48834c36f003dbbc54275215a16afc68')
sha256sums_aarch64=('a38c294dd7aa44d8a7984baf9be5ed469be2621bd8cfd36e0f80b32b24c17559')
sha256sums_x86_64=('2a12f0f3867f75144e5259123dbce704ff06df3e5601457d42138591b88d6b10')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|/usr/bin|/opt/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib64/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/translations/${_pkgname}_fr_FR.qm" -t "${pkgdir}/opt/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}