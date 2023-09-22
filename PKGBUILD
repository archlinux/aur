# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.17.18
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
sha256sums=('7736b1dbda2b18af09232f9eb619e4d3d79d855058cc7494853f25d1553ed00b')
sha256sums_aarch64=('888d916e2e081e167b3af28daf6cdae7c37eeb48e3b53d4786aec34b642f8bbe')
sha256sums_armv7h=('4a839fcb99094a736e84f2eb6495d02f555cfe56c8d078ec56a422d3a7fdda7e')
sha256sums_x86_64=('8daa602a4927c0b953c20e1483e4d79f5b75efab299913e6e1b57473da024d4e')
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