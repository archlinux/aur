# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-bin
pkgver=0.1.0
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
sha256sums=('7dbeb6dfd0052b68e81f5e906e91b72f474018428b2f2fba10734c8041f8da35')
sha256sums_x86_64=('98e6a08f11b8460b6b802c4256d49e87f7920776352d97a5482a65c8bbc1c49d')
sha256sums_aarch64=('f77aaf5df5738982e01ee616ef4f143d0a188d346ae94624c1fba438b43ca0bb')

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
