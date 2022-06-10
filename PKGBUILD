# Maintainer: Kaan Genc <kaan@bgenc.net>

_pkgname=gandi-live-dns
pkgname=gandi-live-dns-rust
pkgver=1.2.1
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


sha256sums=('4f9dd02e0e03fd838081c3a8dd88b386411204853399f78fa83e8781271a012f'
            '7ae1a8fa18e0ef41aa42c94b4a364fdab0a6c9520cbea486f8c9c7f5da22e88f'
            'cd3b1ab682d421e8b9f230d9f44c07a9afe54ce12e55a2990fcbe606e4ccb9a3'
            'a0e652bf8fd879dcbb96488322cac572346fa9a1dbbc2cac08b94b12d9629128')
sha256sums_x86_64=('ff80efb83aa9b90dcb3748d59eefb98b4df9748e0d96097c9137dd700dd715a3')
sha256sums_armv6h=('2cefa4a944c04a12a1311c7fbbb25ca7c8df3fede34762b779d7a56a02e9f99c')
sha256sums_armv7h=('f91170d9883201020a4c6efb69967ba473f180f45d1f6cd331f05cf6e3ab29fb')
sha256sums_aarch64=('5a94d76071b15e4435b699facaad319eb709b5a14de28ff57e76f91aced6c88a')
