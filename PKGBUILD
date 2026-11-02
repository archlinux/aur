# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=badness-bin
pkgver=0.29.0
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
sha256sums_x86_64=('cf23e622018d5af05872ce6dfe477d5bf920bcf61cab8cb8d04ddcf6a4d932d7')
sha256sums_aarch64=('546cb6daa4b4dbd1bf6c8b887277900f22f59d199a2c13f324bde786af4b7fac')

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
