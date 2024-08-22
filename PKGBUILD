# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.17.4"
pkgrel=1
pkgdesc="An experimental Julia version manager"
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


sha256sums_x86_64=('7d25f9cd8b296b4f274d58e3a413f342b595fb7e43ac5c2d2851a8e96abaf521')
sha256sums_aarch64=('2ed05bbb7091090bd8bacc95e4382d0ade17fe814f98f95781d88d6efcdb310a')
sha256sums_i686=('4ff97c735630a40126651553c2a2983abad381ca33cd79991b268dd433194b40')
