# Maintainer: thongor77 <magetriste@proton.me>
pkgname=nmlinux
pkgver=1.2.7
pkgrel=1
pkgdesc="A free Linux adaptation of NETworkManager — network GUI for KDE/Linux"
arch=('any')
url="https://github.com/thongor77/nmlinux"
license=('GPL2')
depends=(
    'python>=3.11'
    'pyside6'
    'python-ptyprocess'
    'python-pyte'
    'networkmanager'
    'iproute2'
    'iputils'
)
optdepends=(
    'nmap: Nmap page and Port Scanner SYN mode'
    'whois: WHOIS lookup page'
    'net-snmp: SNMP page (snmpwalk/snmpget)'
    'bind: DNS lookup via dig'
    'traceroute: Traceroute alternative (tracepath used by default)'
    'python-hwdata: OUI vendor lookup in IP Scanner'
    'nm-connection-editor: Edit connections from Connection Manager'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://github.com/thongor77/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ddba795e1cb7651560d886b4b54efdc0c752510b9bdd8bc075c3ea93fbb26e39')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 data/nmlinux.desktop "${pkgdir}/usr/share/applications/nmlinux.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
