# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=badness-bin
pkgver=0.16.0
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
sha256sums_x86_64=('4a2248c35be479518f0b8e57e93bc79f772ceaa7f95254342c9384d34d6954bc')
sha256sums_aarch64=('9ed3223d2551c1a67a991609ee6068dac8aa089104ad7a34ad6de80a08ff9832')

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
