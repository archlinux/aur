# Maintainer: cihan shibne123@gmail.com
pkgname=deadlock-server-picker
pkgver=1.5.2
pkgrel=1
pkgdesc="A native Linux tool to block/unblock Deadlock game server relays using iptables"
arch=('any')
url="https://github.com/shibne/DeadlockServerPicker-linux"
license=('GPL-3.0-only')
depends=('python' 'python-rich' 'iptables')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'nftables: alternative firewall backend (modern replacement for iptables)'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('838032417cc22536aa24f28d54a441cd0b9b21cea5a792a4eba76411e7a9165c')

build() {
    cd "${srcdir}/DeadlockServerPicker-linux-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/DeadlockServerPicker-linux-${pkgver}"
    
    # Install the Python package
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
}
