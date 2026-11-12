# Maintainer: Gentrit Biba <gentritbiba@gmail.com>
pkgname=cogpit
pkgver=3.7.0
pkgrel=1
pkgdesc="Control center for Claude Code, OpenAI Codex, and GitHub Copilot CLI sessions"
arch=('x86_64')
url="https://github.com/gentritbiba/cogpit"
license=('MIT')
depends=('c-ares' 'gcc-libs' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libxcrypt-compat' 'libxss' 'mesa' 'nss' 'alsa-lib')
source=("${pkgname}-${pkgver}.pacman::https://github.com/gentritbiba/cogpit/releases/download/v${pkgver}/cogpit-${pkgver}.pacman")
sha256sums=('88e1edbae33dfb32793407e129cac07687f3da86105032eb8b4ee5d8c43045cf')
# !strip: install the release's binaries exactly as built (cogpit-core is
# stripped at build time, Electron ships stripped). !debug: nothing to split.
options=('!strip' '!debug')

package() {
    cd "${srcdir}"
    tar -xf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/" \
        --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL'

    # chrome-sandbox requires suid for Chromium sandboxing
    chmod 4755 "${pkgdir}/opt/Cogpit/chrome-sandbox"
}
