# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-auto-bin
_pkgname="Clash Auto"
pkgver=2.4.8
pkgrel=1
pkgdesc="use clash.meta & speedtest & easy to use"
arch=('x86_64')
url="https://clashr-auto.gitbook.io/"
_githuburl="https://github.com/ClashrAuto/Clashr-Auto-Desktop"
license=('unknown')
providers=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nss' 'at-spi2-core' 'alsa-lib' 'gtk3' 'expat' 'libxkbcommon' 'libdrm' 'glib2' 'wayland' \
    'cairo' 'libxcomposite' 'libxdamage' 'libcups' 'glibc' 'pango' 'libxrandr' 'libx11' 'gcc-libs' \
    'libxcb' 'mesa' 'libxext' 'libxfixes' 'dbus' 'nspr')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-amd64_${pkgver}_amd64.deb")
sha256sums=('96580e856ec3f28b9aab5fa298e33c09f4a6b90c2033117aa9ef5030761c32c6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}