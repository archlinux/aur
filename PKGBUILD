# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemon-unstable-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal dashboard for cargo-rake lifecycle events (pre-compiled binary, unstable build)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/rakemon"
license=('custom')
provides=('rakemon')
conflicts=('rakemon')
makedepends=()
options=(!strip !debug)

# rakemon's source repository is private; binaries and the dist sidecar
# bundle are mirrored to the public rustyhorde/rakemon-packages repo on every
# release specifically so anonymous AUR build servers can fetch them.
_base="https://github.com/rustyhorde/rakemon-packages/releases/download/v${pkgver}"

source=("${_base}/dist-rakemon.tar.gz")
source_x86_64=("rakemon-unstable-x86_64::${_base}/rakemon-unstable-x86_64-unknown-linux-musl")
source_aarch64=("rakemon-unstable-aarch64::${_base}/rakemon-unstable-aarch64-unknown-linux-musl")
# Checksums are filled in by the release workflow before publishing to the AUR.
sha256sums=('816530f509a95050354205c52f23ece5b55e9cdb00f8b36b1adbcf46cc0e73e4')
sha256sums_x86_64=('36c47175cb8a2efe67f74bd4cf100d59b74c84d9e33ec36c72974fb76511b3cf')
sha256sums_aarch64=('5ba937206a0b7b1fe99898484aecc6183c030bbb05790ec0f75cce51d9e09b35')

package() {
    install -Dm755 "rakemon-unstable-${CARCH}" "$pkgdir/usr/bin/rakemon"

    # Man page
    install -Dm644 rakemon/rakemon.1 "$pkgdir/usr/share/man/man1/rakemon.1"

    # Shell completions
    install -Dm644 rakemon/rakemon.bash \
        "$pkgdir/usr/share/bash-completion/completions/rakemon"
    install -Dm644 rakemon/_rakemon \
        "$pkgdir/usr/share/zsh/site-functions/_rakemon"
    install -Dm644 rakemon/rakemon.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rakemon.fish"

    # Documentation
    install -Dm644 rakemon/README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    # License
    install -Dm644 rakemon/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
