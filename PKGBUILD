# Maintainer: skssmd <skssmd78475@gmail.com>
pkgname=aibrowsertoolkit-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Browser API for AI agents, over HTTP"
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
sha256sums_x86_64=('cc641d1434881554fed2532050cd855a2dcbc4fcf3eb7b67a18cf1de14d8bff0')
sha256sums_aarch64=('56c190f3eaf74bfbda194d9d805ac2ce03e6aca72205456ca51d797e36ffa49d')

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
}
