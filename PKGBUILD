# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ttl-bin
pkgver=0.18.2
pkgrel=1
pkgdesc="Fast, modern traceroute with real-time TUI, per-hop stats, ASN/geo lookup, ECMP detection, and MPLS label parsing"
arch=('x86_64' 'aarch64')
url="https://github.com/lance0/ttl"
license=('Apache-2.0' 'MIT')
provides=('ttl')
conflicts=('ttl')
install=ttl-bin.install
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/lance0/ttl/releases/download/v${pkgver}/ttl-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/lance0/ttl/releases/download/v${pkgver}/ttl-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a54e4f76ba98f0d1c382e53031f7155087af015929d5314b731b14da85473316')
sha256sums_aarch64=('805dc9cdf16ce6f5ca3b44af995a78276d7457a62c68b0d1b094179271b71bba')

package() {
    install -Dm755 "${srcdir}/ttl" "${pkgdir}/usr/bin/ttl"

    "${srcdir}/ttl" --completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ttl"
    "${srcdir}/ttl" --completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ttl"
    "${srcdir}/ttl" --completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ttl.fish"
}
