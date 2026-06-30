# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ttl-bin
pkgver=0.20.1
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
sha256sums_x86_64=('c482b3ddef910e7cb10dbd8e8e1226099eb78f0a838b0cad4bf5de732fb6e296')
sha256sums_aarch64=('a9de9ac31369553cdb5fc9dc15c548d288728f798c82542831b2817c96d4a514')

package() {
    install -Dm755 "${srcdir}/ttl" "${pkgdir}/usr/bin/ttl"

    "${srcdir}/ttl" --completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ttl"
    "${srcdir}/ttl" --completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ttl"
    "${srcdir}/ttl" --completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ttl.fish"
}
