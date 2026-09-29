# Maintainer: skssmd <skssmd78475@gmail.com>
pkgname=aibrowsertoolkit-bin
pkgver=0.7.4
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
sha256sums_x86_64=('932178e0979a179644f0abd55a03477de239b7d33e54ed7711a9d593b51a13d2')
sha256sums_aarch64=('d526fe1cf5209f441bcf56f794b7bdb102007a4405966cdab75b7b7e24b563fa')

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
