# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.17.19"
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


sha256sums_x86_64=('7b73c2c2b8693ff0bbb2e57be2af2cdc8de56827a60ebf7c289ca40338184bb0')
sha256sums_aarch64=('fb5c2b6e5ab38c816acb5ddd7251625cf157fd8b40ff993da9d9c769f6bf7cbd')
sha256sums_i686=('ee3f71955548a1ef65082b18f1aabfad8ecdc4bf2e4c987ab67d2bf1597548d3')
