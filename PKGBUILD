# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Configuration-driven build tool that runs Rakefile.toml targets (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/cargo-rake"
license=('MIT' 'Apache-2.0')
provides=('rake')
conflicts=('rake')
makedepends=()
options=(!strip !debug)

_base="https://github.com/rustyhorde/cargo-rake/releases/download/v${pkgver}"

source=("${_base}/dist-rake.tar.gz")
source_x86_64=("rake-x86_64::${_base}/rake-x86_64-unknown-linux-musl")
source_aarch64=("rake-aarch64::${_base}/rake-aarch64-unknown-linux-musl")
# Checksums are filled in by the release workflow before publishing to the AUR.
sha256sums=('9145c39a5c4ecc2628772686784c135972595cf28e5f9ae85b810b04b96667bc')
sha256sums_x86_64=('c6daa7d3bdced171fc0289d469cc3c10c2d1218dc8102f43139c6e15c3c8dd16')
sha256sums_aarch64=('6b5c0cacaa4c651214a9ffe16309c5f6fe8707de6e607439038bccf77e840ba4')

package() {
    install -Dm755 "rake-${CARCH}" "$pkgdir/usr/bin/rake"

    # Man page
    install -Dm644 rake/rake.1 "$pkgdir/usr/share/man/man1/rake.1"

    # Shell completions
    install -Dm644 rake/rake.bash \
        "$pkgdir/usr/share/bash-completion/completions/rake"
    install -Dm644 rake/_rake \
        "$pkgdir/usr/share/zsh/site-functions/_rake"
    install -Dm644 rake/rake.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rake.fish"

    # Example Rakefile
    install -Dm644 rake/Rakefile.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/Rakefile.toml.example"

    # Licenses
    install -Dm644 rake/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 rake/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
