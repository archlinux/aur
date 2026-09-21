# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=badness-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="A language server, formatter, and linter for LaTeX"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/badness"
license=('MIT')
depends=('gcc-libs')
provides=('badness')
conflicts=('badness')
options=(!strip)
source_x86_64=("badness-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/badness-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("badness-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/badness-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d42c51ad8fa9a719c369434b44d314c8cfd360e3fa70b2730c2b6253f99eb609')
sha256sums_aarch64=('8e15983d0ef77e5a1d5b19cff93be75628b92c33275fdccce5f68c6c2464d166')

package() {
    install -Dm755 badness "$pkgdir/usr/bin/badness"

    # Release tarballs up to v0.13.0 predate the man-page and completion
    # bundling; the guards can go once pkgver is past that.
    if [ -d man ]; then
        install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
    fi

    if [ -d completions ]; then
        install -Dm644 completions/badness.bash "$pkgdir/usr/share/bash-completion/completions/badness"
        install -Dm644 completions/badness.fish "$pkgdir/usr/share/fish/vendor_completions.d/badness.fish"
        install -Dm644 completions/_badness "$pkgdir/usr/share/zsh/site-functions/_badness"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
