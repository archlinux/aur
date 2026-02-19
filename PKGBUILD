# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.19.9"
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


sha256sums_x86_64=('e700928b7fe26d0d5e834319ac326baa23dd83435f76c5d151a5e17f886cf874')
sha256sums_aarch64=('fa2e86edc3b7593c3cd90045e9908b8d160a8ce6820ee422289487f0c27170f4')
sha256sums_i686=('1646927f65e66581f7c2691d7c5b1b97f8cf1024aae59636d28e064494f990ce')
