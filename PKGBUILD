# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartoc-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Barto job executor client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('bartoc')
conflicts=('bartoc')
depends=()
optdepends=('logrotate: periodic cleanup of rotated log files'
            'xz: xz compression of rotated log files')
makedepends=()

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartoc.tar.gz")
source_x86_64=("bartoc-x86_64::${_base}/bartoc-x86_64-unknown-linux-musl")
source_aarch64=("bartoc-aarch64::${_base}/bartoc-aarch64-unknown-linux-musl")
sha256sums=('62102871d7922afd9beb1f0bad2a46a47e2fb5ff785a4dcb5840c43fa11d3e63')
sha256sums_x86_64=('1916b53d280c6f11e1e722e75dcc24990059c21346aec3aba568377900fd7472')
sha256sums_aarch64=('086410a7b24464b920e31902c2806cbf45b5081a6a564f2e929ce528c8214c79')

package() {
    install -Dm755 "bartoc-${CARCH}" "$pkgdir/usr/bin/bartoc"

    # Man page
    install -Dm644 bartoc/bartoc.1 "$pkgdir/usr/share/man/man1/bartoc.1"

    # Shell completions
    install -Dm644 bartoc/bartoc.bash \
        "$pkgdir/usr/share/bash-completion/completions/bartoc"
    install -Dm644 bartoc/_bartoc \
        "$pkgdir/usr/share/zsh/site-functions/_bartoc"
    install -Dm644 bartoc/bartoc.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartoc.fish"

    # Systemd service
    install -Dm644 bartoc/bartoc.service \
        "$pkgdir/usr/lib/systemd/system/bartoc.service"

    # Logrotate
    install -Dm644 bartoc/bartoc.logrotate \
        "$pkgdir/etc/logrotate.d/bartoc"

    # Example config
    install -Dm644 bartoc/bartoc.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartoc.toml.example"

    # Licenses
    install -Dm644 bartoc/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartoc/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
