# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
#    'bash'
#    'electron27'
    'dbus'
    'at-spi2-core'
    'nss'
    'libxdamage'
    'libxcb'
    'cairo'
    'libcups'
    'libxfixes'
    'libxcomposite'
    'nspr'
    'libxext'
    'alsa-lib'
    'pango'
    'expat'
    'mesa'
    'gtk3'
    'libxrandr'
    'libx11'
    'libxkbcommon'
    'libdrm'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
#source=("${pkgname%-bin}.sh")
sha256sums_aarch64=('e407e20f608a6b54c6cb6ffdea3150a1a3d8eaee2f7386d5b75b56ab55eb4373')
sha256sums_armv7h=('737e5d2f67f06267a149d6718a904822d43eb8c0520d7494d4110e40ba47bd1d')
sha256sums_x86_64=('f628d09f6c7a0679d350abc0031f32cb9e9650cfa1e09a42de279afedb97c6dd')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U| --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    #install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    #cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}