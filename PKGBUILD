# Maintainer: Gentrit Biba <gentritbiba@gmail.com>
pkgname=cogpit
pkgver=1.1.3
pkgrel=1
pkgdesc="Dashboard for browsing and inspecting Claude Code agent sessions"
arch=('x86_64')
url="https://github.com/gentritbiba/cogpit"
license=('MIT')
depends=('c-ares' 'gcc-libs' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libxcrypt-compat' 'libxss' 'mesa' 'nss' 'alsa-lib')
source=("${pkgname}-${pkgver}.pacman::https://github.com/gentritbiba/cogpit/releases/download/v${pkgver}/cogpit-${pkgver}.pacman")
sha256sums=('b36a760a95b8dbae0c72c100c12eefd18ef16e40cf1f095e9c7f3fd94f18d296')
# !strip: the .pacman payload bundles the Bun-compiled Claude CLI under
# app.asar.unpacked; makepkg's default strip truncates its embedded JS bundle
# and breaks session spawning. !debug: no symbols to split without strip.
options=('!strip' '!debug')

package() {
    cd "${srcdir}"
    tar -xf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/" \
        --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL'

    # chrome-sandbox requires suid for Chromium sandboxing
    chmod 4755 "${pkgdir}/opt/Cogpit/chrome-sandbox"
}
