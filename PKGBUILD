# Maintainer: skssmd <skssmd78475@gmail.com>
pkgname=aibrowsertoolkit-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="Agentic browser automation CLI for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/skssmd/Ai-Browser-Toolkit"
license=('Apache-2.0')
# Chrome is required at runtime but is not in the repos, and Edge counts too --
# a hard dependency would make this uninstallable on a clean Arch box.
optdepends=('google-chrome: the browser this drives'
            'microsoft-edge-stable-bin: alternative browser')
provides=('aibrowsertoolkit')
conflicts=('aibrowsertoolkit')
options=('!strip')
install="${pkgname}.install"
source_x86_64=("${url}/releases/download/v${pkgver}/aibrowsertoolkit-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/aibrowsertoolkit-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('b8d9d7ed929a21b2a4eeb522f26917158a24d7d40a833fe64c0864471d914aba')
sha256sums_aarch64=('090118adc6de62e8fdf9fc2677dec189a7494b7f56556da31d93a5a9af6a0393')

package() {
    # The tarball's top-level directory is named for the bundle target, and
    # CARCH is x86_64 or aarch64 -- which match by construction. That is why
    # packaging/bundle.py's TARGETS uses those exact strings.
    local src="${srcdir}/aibrowsertoolkit-${pkgver}-linux-${CARCH}"
    install -dm755 "${pkgdir}/opt/aibrowsertoolkit"
    cp -a "${src}/." "${pkgdir}/opt/aibrowsertoolkit/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/aibrowsertoolkit/bin/abt "${pkgdir}/usr/bin/abt"
    install -Dm644 "${src}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # The desktop app in the app menu: clicked, not typed.
    install -Dm644 "${src}/assets/aibrowsertoolkit.desktop" "${pkgdir}/usr/share/applications/aibrowsertoolkit.desktop"
    install -Dm644 "${src}/assets/logo-white-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/aibrowsertoolkit.png"
}
