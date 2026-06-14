# Maintainer: mr-tanta <sir.tanta@gmail.com>
pkgname=portkill
pkgver=3.2.0
pkgrel=1
pkgdesc="Advanced port management and network analysis tool with performance benchmarking"
arch=('any')
url="https://github.com/mr-tanta/portkill"
license=('MIT')
depends=('bash' 'coreutils' 'procps-ng' 'iproute2')
optdepends=(
    'bc: for advanced mathematical calculations in benchmarking'
    'openbsd-netcat: for enhanced network connectivity testing'
    'lsof: for exact process detection with lsof'
    'psmisc: for fuser fallback process detection'
    'net-tools: for netstat fallback process detection'
    'docker: for Docker container management'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mr-tanta/portkill/archive/v${pkgver}.tar.gz")
sha256sums=('bcdba82153275c02a65177442f92285d64de2e48ca44697c29485e0949145525')
backup=('etc/portkill/portkill.conf')

package() {
    cd "${pkgname}-${pkgver}"
    
    # Install main script
    install -Dm755 bin/portkill "${pkgdir}/usr/bin/portkill"
    
    # Install configuration file
    install -Dm644 portkill.conf "${pkgdir}/etc/portkill/portkill.conf"
    
    # Install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    bin/portkill completion bash > "${pkgdir}/usr/share/bash-completion/completions/portkill"
    bin/portkill completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_portkill"
    bin/portkill completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/portkill.fish"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [[ -f assets/portkill-preview.gif ]]; then
        install -Dm644 assets/portkill-preview.gif "${pkgdir}/usr/share/doc/${pkgname}/assets/portkill-preview.gif"
    fi
    
    # Install install/uninstall scripts as documentation
    install -Dm644 install.sh "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
    install -Dm644 uninstall.sh "${pkgdir}/usr/share/doc/${pkgname}/uninstall.sh"
}

# vim:set ts=4 sw=4 et:
