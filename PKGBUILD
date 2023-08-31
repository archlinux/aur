# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.17.12
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxrandr' 'expat' 'libx11' 'dbus' 'nss' 'libxfixes' 'gcc-libs' 'alsa-lib' 'mesa' 'pango' 'bash' 'libxext' 'libxdamage' \
    'glibc' 'gtk3' 'glib2' 'nspr' 'libxcomposite' 'libdrm' 'libcups' 'at-spi2-core' 'libxkbcommon' 'libxcb' 'cairo')
#depends=('bash' 'electron26')
#makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/main/LICENSE")
#    "${pkgname%-bin}.sh")
sha256sums=('7736b1dbda2b18af09232f9eb619e4d3d79d855058cc7494853f25d1553ed00b')
sha256sums_aarch64=('915113d5241f7b9b359dd9894fb43a7135a48358df3daf994300dffba7c3739c')
sha256sums_armv7h=('7c03e089a16a0d297da42dbde19cb3332b65f1d4af1e9cc775ca48997a32e06a')
sha256sums_x86_64=('f63def9cb04f3ba86676d5c64992cc76b58077faedcac41bb2e723a5a7e0210c')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    #asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
#    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}