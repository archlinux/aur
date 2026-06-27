# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-unstable-bin
pkgver=0.4.4
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
sha256sums=('9927d363cf2eb65231fa761d693776ef85686e6b0639537b9bd5191cd8b196ec')
sha256sums_x86_64=('588abb929f866ddaccb7fdea5accfc3233d62d4e04a4887c64be897c8c139509')
sha256sums_aarch64=('ed6c56626540e73991ae3e228e2f88b4370ef5ad4a108f246054873d687c5ec3')

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
