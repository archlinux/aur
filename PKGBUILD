# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('libxrandr' 'expat' 'libx11' 'dbus' 'nss' 'libxfixes' 'gcc-libs' 'alsa-lib' 'mesa' 'pango' 'bash' 'libxext' 'libxdamage' \
    'glibc' 'gtk3' 'glib2' 'nspr' 'libxcomposite' 'libdrm' 'libcups' 'at-spi2-core' 'libxkbcommon' 'libxcb' 'cairo')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/v${pkgver}/LICENSE")
sha256sums=('bcb1a9f42beeababd8267db00d5b7bfec20e671b8c47374b80dbd25b655146ec')
sha256sums_aarch64=('4867129cc56f753e633bc88afb33e12bcce09f36c64f21a8e999abf3368e7878')
sha256sums_armv7h=('72e3a368fe32d522f3f1ad45d528ef2ee3528eb01763f6f9374460a8e79185fb')
sha256sums_x86_64=('9408e741e4362a63b615693ffefb7047f8d00f984653e724e37820bae0a104d3')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U| --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}