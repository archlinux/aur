# Maintainer: Kaan Genc <kaan@bgenc.net>

_pkgname=gandi-live-dns
pkgname=gandi-live-dns-rust
pkgver=1.8.0
pkgrel=1
pkgdesc="Automatically updates your IP address for Gandi's Live DNS."
_repo_path="SeriousBug/gandi-live-dns-rust"
url="https://github.com/${_repo_path}"
license=('MIT')
install="gandi-live-dns.install"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
backup=("etc/gandi-live-dns/gandi.conf")
depends=() # Dependency free

_github_file_common="https://raw.githubusercontent.com/${_repo_path}/${pkgver}"
source=(
    "${_github_file_common}/example.toml"
    "${_github_file_common}/Packaging/gandi-live-dns.service"
    "${_github_file_common}/Packaging/gandi-live-dns.timer"
    "${_github_file_common}/Packaging/gandi-live-dns.sysusers"
)
_source_common="${url}/releases/download/${pkgver}/${_pkgname}.${pkgver}.linux"
source_x86_64=("${_source_common}-x86_64.tar.xz")
source_armv6h=("${_source_common}-armv6.tar.xz")
source_armv7h=("${_source_common}-armv7.tar.xz")
source_aarch64=("${_source_common}-arm64.tar.xz")

package() {
    # Install service files
    install -Dm644 gandi-live-dns.service "${pkgdir}/usr/lib/systemd/system/gandi-live-dns.service"
    install -Dm644 gandi-live-dns.timer "${pkgdir}/usr/lib/systemd/system/gandi-live-dns.timer"
    install -Dm644 gandi-live-dns.sysusers "${pkgdir}/usr/lib/sysusers.d/gandi-live-dns.conf"

    # Add the example config
    mkdir -m600 -p "${pkgdir}/etc/gandi-live-dns"
    install -Dm600 example.toml "${pkgdir}/etc/gandi-live-dns/example.toml"

    # Install the program itself
    install -Dm755 gandi-live-dns "${pkgdir}/usr/bin/gandi-live-dns"
}

sha256sums=('1940b9570eae399d9efd3209b3da27dbc047285bc5a03ed8e31df02dea21ad4a'
            '7ae1a8fa18e0ef41aa42c94b4a364fdab0a6c9520cbea486f8c9c7f5da22e88f'
            'cd3b1ab682d421e8b9f230d9f44c07a9afe54ce12e55a2990fcbe606e4ccb9a3'
            'a0e652bf8fd879dcbb96488322cac572346fa9a1dbbc2cac08b94b12d9629128')
sha256sums_x86_64=('045901585457189a38626b57ef3fb25eae27510c63b222ba96927a1b266cd91b')
sha256sums_armv6h=('3508c8986ca17bd42fb526ef45dc57415303b098542f9bc3bbd2cb49c9deb527')
sha256sums_armv7h=('3901d68d10adfda6de05ae249e86b213369326a740bf1e9c5a6e24a9502ce358')
sha256sums_aarch64=('d18b310d446c8e0c4c425fedf876ae453f5e563ea3fd4d919b70d16be580d2e3')
