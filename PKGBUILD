# Maintainer: Kaan Genc <kaan@bgenc.net>

pkgname=gandi-live-dns-rust
pkgver=1.0.1
_source_ver=1.0.2 # Needed to work around a packaging mishap. Remove later.
pkgrel=1
pkgdesc="Automatically updates your IP address for Gandi's Live DNS."
_repo_path="SeriousBug/gandi-live-dns-rust"
url="https://github.com/${_repo_path}"
license=('MIT')
install="gandi-live-dns.install"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
backup=("etc/gandi-live-dns/gandi.conf")
depends=() # Dependency free


_github_file_common="https://raw.githubusercontent.com/${_repo_path}/${_source_ver}"
source=(
    "${_github_file_common}/example.toml"
    "${_github_file_common}/Packaging/gandi-live-dns.service"
    "${_github_file_common}/Packaging/gandi-live-dns.timer"
    "${_github_file_common}/Packaging/gandi-live-dns.sysusers"
)
_source_common="${url}/releases/download/${pkgver}/${pkgname}.${pkgver}.linux"
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
sha256sums_x86_64=('75afe5409f4e98b91ef5966fbf6e2bfdeaccb299c2ccd35e722606ed0779c9f0')
sha256sums_armv6h=('cc8465bc0a8d1de0bbb1817071d5aadce5a30287e8a7f6f357180559cddbd78d')
sha256sums_armv7h=('95f80dd4fab25b4e6aeb4278e4b19255277000515d1ffacc03189c162b0c3b5c')
sha256sums_aarch64=('df5c93303707ff60a015da4548f80218978247c886152b2f59b8509826245c34')
