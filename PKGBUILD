# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ttl-bin
pkgver=0.20.2
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
sha256sums_x86_64=('9652eeb6dc0f5e51ddbbc38a6ee829b2d5eccaeb0b7a9101a8864f5f1ece9b94')
sha256sums_aarch64=('d8b77fe1682743d30cd4de20192a1ac479ffd1ff2f7ccf4b11b6658f3638875b')

package() {
    install -Dm755 "${srcdir}/ttl" "${pkgdir}/usr/bin/ttl"

    "${srcdir}/ttl" --completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ttl"
    "${srcdir}/ttl" --completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ttl"
    "${srcdir}/ttl" --completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ttl.fish"
}
