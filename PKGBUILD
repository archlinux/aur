# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-unstable-bin
pkgver=0.5.4
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
sha256sums=('342a50b8871f09808f5d9b47760e26910c3bf17bcda7fdb476ef6faab02e9e5f')
sha256sums_x86_64=('b06c8e8e54d49564fc3d700c1c38bec5e0c6b2c85aa41b6d048722704389543d')
sha256sums_aarch64=('82da143663459e6773d1ab16490f3c768f6492ffb4b48c88629748c514f3915b')

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
