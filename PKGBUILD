# Maintainer: Gentrit Biba <gentritbiba@gmail.com>
pkgname=cogpit
pkgver=2.7.4
pkgrel=1
pkgdesc="Dashboard for browsing and inspecting Claude Code agent sessions"
arch=('x86_64')
url="https://github.com/gentritbiba/cogpit"
license=('MIT')
depends=('c-ares' 'gcc-libs' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libxcrypt-compat' 'libxss' 'mesa' 'nss' 'alsa-lib')
source=("${pkgname}-${pkgver}.pacman::https://github.com/gentritbiba/cogpit/releases/download/v${pkgver}/cogpit-${pkgver}.pacman")
sha256sums=('9fe3202f5f289ca63a3e5a63aa96bf84baacef8e1aff93b29b3bbd5ad58a56a3')
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
