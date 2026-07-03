# Maintainer: thongor77 <magetriste@proton.me>
pkgname=nmlinux
pkgver=1.7.3
pkgrel=1
pkgdesc="A unified network toolkit for Linux and macOS — SSH, WinRM, topology, 29 modules"
arch=('any')
url="https://github.com/thongor77/nmlinux"
license=('GPL2')
depends=(
    'python>=3.11'
    'pyside6'
    'python-ptyprocess'
    'python-pyte'
    'python-tftpy'
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
    'samba: SMB/NFS browser — SMB share listing (smbclient)'
    'nfs-utils: SMB/NFS browser — NFS export listing (showmount)'
    'cifs-utils: SMB/NFS browser — mount SMB shares from the right-click menu'
    'openssl: TLS Inspector certificate chain'
    'avahi: Topology — mDNS device type detection (printers, phones, NAS…)'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://github.com/thongor77/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74696633632bd423ce1f42479f0ee0d7bcb16d843bac3f79d06bbc3f61d70bcb')

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
