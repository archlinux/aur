# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=tomat-bin
pkgver=2.15.0
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
sha256sums_x86_64=('1bc906a6fae6611eb4c50a9ab9146f5c3e4c87b85f3f2ab8fa3d3c6dddd44be1')
sha256sums_aarch64=('aaa83307bb0d3253ac88b07a64d119a06806a4c340f32f384c439f84e8832605')

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
