# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgname=lm-studio-bin
pkgver=0.4.24
pkgrel=1
pkgdesc="Discover, download, and run LLMs locally. Use the chat UI or local server to experiment and develop with local LLMs (Official binary package with bundled Electron)"
arch=('x86_64')
url="https://lmstudio.ai"
license=('custom')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
)
optdepends=('libappindicator')
conflicts=('lmstudio-bin')
provides=('lmstudio-bin')
source=(
    "lm-studio"
    "https://installers.lmstudio.ai/linux/x64/${pkgver}-${pkgrel}/LM-Studio-${pkgver}-${pkgrel}-x64.deb"
)
sha256sums=('f36b30a1c02919f7fa1831406da8695c888588099d1ceb69efc326bd73d38f29'
            '0dcf3dd50d7d5774897132d6cba2489c3abc1fc9e98eea44ab48be573b8d0a5d')
install="lm-studio.install"
options=("!strip")


package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    sed -i "s|/opt/LM-Studio/lm-studio|lm-studio|g" "${pkgdir}/usr/share/applications/ai.elementlabs.lmstudio.desktop"
    install -Dm755 "${srcdir}/lm-studio" "${pkgdir}/usr/bin/lm-studio"
    install -Dm644 "${pkgdir}/opt/LM-Studio/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/LM-Studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
