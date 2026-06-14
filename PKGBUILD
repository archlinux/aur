# Maintainer: mr-tanta <sir.tanta@gmail.com>
pkgname=portkill
pkgver=3.1.1
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
sha256sums=('4be05f61748ad93db87640183013dca7825f07cfabb125a6d654074b4d67ee80')
backup=('etc/portkill/portkill.conf')

package() {
    cd "${pkgname}-${pkgver}"
    
    # Install main script
    install -Dm755 bin/portkill "${pkgdir}/usr/bin/portkill"
    
    # Install configuration file
    install -Dm644 portkill.conf "${pkgdir}/etc/portkill/portkill.conf"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install install/uninstall scripts as documentation
    install -Dm644 install.sh "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
    install -Dm644 uninstall.sh "${pkgdir}/usr/share/doc/${pkgname}/uninstall.sh"
    
    # Create completion directory (for future bash completion support)
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
}

# vim:set ts=4 sw=4 et:
