# Maintainer: skssmd <skssmd78475@gmail.com>
pkgname=aibrowsertoolkit-bin
pkgver=0.3.2
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
sha256sums_x86_64=('cad6f4f31fbd2a3f640e69b264facbdf183a07005e9e588eb4a4e33aeaf1e208')
sha256sums_aarch64=('4807be3cca91e859344dffa933f75d14a9d827b6389fd8b139d2fcd252891e63')

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
