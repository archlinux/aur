# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-unstable-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Configuration-driven build tool that runs Rakefile.toml targets (pre-compiled, nightly unstable build)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/cargo-rake"
license=('MIT' 'Apache-2.0')
provides=('rake')
conflicts=('rake')
makedepends=()
options=(!strip !debug)

_base="https://github.com/rustyhorde/cargo-rake/releases/download/v${pkgver}"

source=("${_base}/dist-rake.tar.gz")
source_x86_64=("rake-unstable-x86_64::${_base}/rake-unstable-x86_64-unknown-linux-musl")
source_aarch64=("rake-unstable-aarch64::${_base}/rake-unstable-aarch64-unknown-linux-musl")
# Checksums are filled in by the release workflow before publishing to the AUR.
sha256sums=('857c77cbe91010dead192f4e435f6fb8a8e469b29d1483a646ee64fbc8758d97')
sha256sums_x86_64=('16728f9ca9b6f8b48c97d0f4f97fb7757f0f017c05f86dbfea1dd00883d00ac9')
sha256sums_aarch64=('db9f7cef8b4c7073d7802f351c8f1b962e28ef8295d0f958f1000530b300070c')

package() {
    install -Dm755 "rake-unstable-${CARCH}" "$pkgdir/usr/bin/rake"

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
