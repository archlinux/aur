# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.20.9"
pkgrel=1
pkgdesc="Julia installer and version multiplexer"
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')
url="https://github.com/JuliaLang/juliaup"
makedepends=("tar")
conflicts=("juliaup" "julia" "julia-bin")
provides=("julia")
source_x86_64=("${url}/releases/download/v$pkgver/juliaup-$pkgver-x86_64-unknown-linux-musl-portable.tar.gz")
source_i686=("${url}/releases/download/v$pkgver/juliaup-$pkgver-i686-unknown-linux-musl-portable.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/juliaup-$pkgver-aarch64-unknown-linux-musl-portable.tar.gz")

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/juliaup" "${pkgdir}/usr/bin/juliaup"
    install -m755 "${srcdir}/julia" "${pkgdir}/usr/bin/julia"

    # Generate completion files.
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir"/usr/bin/juliaup completions bash > "$pkgdir/usr/share/bash-completion/completions/juliaup"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir"/usr/bin/juliaup completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/juliaup.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir"/usr/bin/juliaup completions zsh > "$pkgdir/usr/share/zsh/site-functions/_juliaup"
}


sha256sums_x86_64=('70c1769f5800f997d476cb29761f017dc95d94843e500d4629b97b3e21bbb5f5')
sha256sums_aarch64=('2a582e85881cb857d27f6e2ff4df331eb17dd50954a5a6a57005c5351d641c56')
sha256sums_i686=('2fa3d6b58772afd0d0685afac2054a6a2d9c6c62d9a522b6153c3a833574d94c')
