# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=rake-unstable-bin
pkgver=0.3.0
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
sha256sums=('8f27ef3b826fff869f4d66a52eed3c2203fa0c962b09e4d4ff31c4818cd0132c')
sha256sums_x86_64=('fbae637cb7e59f9ce4c4369ecfe50a81718e6fd5202f60bcdab65972fc8a2246')
sha256sums_aarch64=('24cdeb986aff567c80e118fd47477125c9164d343930e263a3101296b3f44572')

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
