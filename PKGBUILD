# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-gpt-git
pkgver=r647.ee65cc9
pkgrel=1
pkgdesc="Simplified chat using OpenAI's GPT"
arch=('x86_64')
url="https://github.com/Bubuclem/electron-gpt"
license=('CC0-1.0')
makedepends=('npm' 'git' 'nodejs' 'gendesk')
depends=('libxcomposite' 'glib2' 'nspr' 'libx11' 'make' 'libcups' 'libxext' 'libxrandr' 'at-spi2-core' 'libxcb' 'libxfixes' 'glibc' \
    'cairo' 'gcc-libs' 'dbus' 'libdrm' 'pango' 'nss' 'python' 'bash' 'nodejs' 'alsa-lib' 'libxkbcommon' 'expat' 'python-setuptools' 
    'libxdamage' 'gtk3' 'mesa')
source=("git+${url}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}"
    npm install
    npm update node-abi
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/out/chatgpt-linux-x64/"* "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/assets/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    gendesk -f -n --icon "${pkgname%-git}" --categories "Utility" --name "${pkgname%-git}" --exec "/opt/${pkgname%-git}/chatgpt %U"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}