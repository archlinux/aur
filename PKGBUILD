pkgname=tomat-bin
pkgver=2.11.0
pkgrel=2
pkgdesc="A Pomodoro timer for status bars"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/tomat"
license=('MIT')
depends=('alsa-lib' 'gcc-libs')
provides=('tomat')
conflicts=('tomat')
options=(!strip)
source_x86_64=("tomat-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/tomat-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("tomat-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/tomat-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('60f42555ebf995bef2dadd8758923444e9dbeec6e6cb6183bb1aca457264f474')
sha256sums_aarch64=('1d88c725efb2846d7def345b2c0190df48def8eec9029487e6ca369c6d53c131')

package() {
    # Binary
    install -Dm755 tomat "$pkgdir/usr/bin/tomat"

    # Man pages
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # Shell completions
    install -Dm644 completions/tomat.bash "$pkgdir/usr/share/bash-completion/completions/tomat"
    install -Dm644 completions/tomat.fish "$pkgdir/usr/share/fish/vendor_completions.d/tomat.fish"
    install -Dm644 completions/_tomat "$pkgdir/usr/share/zsh/site-functions/_tomat"

    # Systemd user service
    install -Dm644 tomat.service "$pkgdir/usr/lib/systemd/user/tomat.service"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
