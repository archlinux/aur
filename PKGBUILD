# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ttl-bin
pkgver=0.15.1
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
sha256sums_x86_64=('66890ed2a1517c8d8c1aaa94edf5890011c5f756e6c1d1fc23ed91c703b8bbe3')
sha256sums_aarch64=('1ff659c73ee394a93cb7fdf46f41146bf454882a6a43c7a86fbbc146dcbfb31f')

package() {
    install -Dm755 "${srcdir}/ttl" "${pkgdir}/usr/bin/ttl"

    "${srcdir}/ttl" --completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ttl"
    "${srcdir}/ttl" --completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ttl"
    "${srcdir}/ttl" --completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ttl.fish"
}
