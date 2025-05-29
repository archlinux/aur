# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=obsidian-bin
pkgver=1.8.10
pkgrel=2
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files. (Official binary package with bundled Electron)"
arch=('x86_64')
url="https://obsidian.md"
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
outdepends=('appindicator-gtk3')
conflicts=('obsidian')
provides=('obsidian')
options=(!strip)
source=("https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/opt/Obsidian/obsidian"
    ln -sf "${pkgdir}/opt/Obsidian/obsidian" "${pkgdir}/usr/bin/obsidian"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
