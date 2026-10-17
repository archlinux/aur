# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=tomat-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="A Pomodoro timer for status bars"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/tomat"
license=('MIT')
depends=('alsa-lib' 'gcc-libs')
provides=('tomat')
conflicts=('tomat')
options=(!strip !debug)
source_x86_64=("tomat-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/tomat-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("tomat-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/tomat-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d3407058d85c262d5337ae8433dfc381dd216b1d585cdba08b43a490b808e611')
sha256sums_aarch64=('95c7fc858676f5bfab03799d055ce77e91794dc73396753b8eb3a22263a14101')

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
