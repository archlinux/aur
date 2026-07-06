# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-bin
pkgver=0.5.3
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
sha256sums=('7afc52068ae7931dc9c7dc253532d6c113149f57f5a38c8d630d4f1e8752981e')
sha256sums_x86_64=('c17b990a825b3d44902af43ec84e7f7e209805dd16168ccd59480ef4e6263755')
sha256sums_aarch64=('095643b7c560ebf85449c5d594cd093883bf6c925d9425b79c4017ca9b331b72')

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
