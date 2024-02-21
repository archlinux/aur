# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=juliaup-bin
pkgver="1.14.5"
pkgrel=1
pkgdesc="An experimental Julia version manager"
arch=('x86_64')
license=('MIT')
url="https://github.com/JuliaLang/juliaup"
makedepends=("tar")
conflicts=("juliaup" "julia" "julia-bin")
provides=("julia")
source=("${url}/releases/download/v$pkgver/juliaup-$pkgver-$CARCH-unknown-linux-musl-portable.tar.gz")
sha256sums=('b03b72c8189d87151a08eef72e66c6f9ce3023e461b20f91f50aa8125b9804da')

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


