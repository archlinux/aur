# Maintainer: Kaan Genc <kaan@bgenc.net>

_pkgname=gandi-live-dns
pkgname=gandi-live-dns-rust
pkgver=1.5.0
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
sha256sums_x86_64=('888008a79a95d3e5a83d8fe6ffc715c4d41776025be3e0aa013d01aaaf775a3b')
sha256sums_armv6h=('7d854c7d0eeebdc98ee139ba5f76ec18c8993f3aaad9fcba09ca3023d1f2035c')
sha256sums_armv7h=('8b5889d5fa6a2fdbd918e21c3073ff9f8ffe43eabc8c3f5469ed0bd154fd0e48')
sha256sums_aarch64=('ff0a368df39545db316dd3f6ef9fd702e5b3e7a871dcc1a86f2e2b16139a55f6')
