# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.18.9"
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


sha256sums_x86_64=('1630a4f59a567db28c5060f6673e7a645ecd07cbbfc4983fa483da2f00ac0c94')
sha256sums_aarch64=('79d8377fbd959d524f30128d795bfbcc254fc8b327c98362e7af5736e2f6f973')
sha256sums_i686=('c2abd947e438cde668d9e686461263add08539b330647062a4a0a1bb2bc155ea')
