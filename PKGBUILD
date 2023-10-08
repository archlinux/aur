# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_pkgname=Monokle
pkgver=2.4.0
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('aarch64' 'x86_64')
url="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('zlib' 'glibc' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'expat' 'libxcomposite' 'libdrm' 'libxkbcommon' 'libxfixes' 'libxdamage' \
    'gtk3' 'glib2' 'nspr' 'mesa' 'libxrandr' 'cairo' 'nss' 'dbus' 'libxext' 'python' 'libx11' 'pango' 'sh' 'libcups' 'libxcb')
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/kubeshop/monokle/v${pkgver}/LICENSE")
sha256sums=('7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
sha256sums_aarch64=('b4a4203af4343e83a92aca1bc65d3fb3449741a47c54ad813a6ee508319f75d7')
sha256sums_x86_64=('4c35ffe9edcc812c8e1dd8f68214ac61c9f639ceb2d5b11d7c0af6a6af6325e3')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}