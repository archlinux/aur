# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ttl-bin
pkgver=0.24.1
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
sha256sums_x86_64=('a08eb976788cb368e7c129ca94295d327b2dd9cbb2fe102048a3f620d2c215b5')
sha256sums_aarch64=('d010cad6189fa541f061f77d85db198a401e1b2f056327285d0ca83bcd529ee9')

package() {
    install -Dm755 "${srcdir}/ttl" "${pkgdir}/usr/bin/ttl"

    "${srcdir}/ttl" --completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ttl"
    "${srcdir}/ttl" --completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ttl"
    "${srcdir}/ttl" --completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ttl.fish"
}
