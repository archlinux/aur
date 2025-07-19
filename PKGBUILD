# Maintainer: Nguyen Ky <nhktmdzhg at gmail dot com>
pkgname=bottom-nightly-autocomplete
pkgver=2025_07_18
pkgrel=1
pkgdesc="Autocompletion for bottom, a graphical process/system monitor"
arch=(i686 x86_64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
provides=('bottom-autocomplete')
depends=('bottom-nightly-bin')
source=("bottom.tar.gz::https://github.com/ClementTsang/bottom/releases/download/nightly/bottom_$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=(
    'SKIP'
)

pkgver() {
    _DATE=$(curl https://api.github.com/repos/ClementTsang/bottom/releases/tags/nightly -s | awk -F '"' '/"'"published_at"'":/{print $4}')
    date --date="$_DATE" +%Y_%m_%d
}

check() {
    ./btm --version
}

package() {
    cd "$srcdir/completion"
    install -Dm644 btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 btm.fish "$pkgdir/usr/share/fish/completions/btm.fish"
    install -Dm644 _btm "$pkgdir/usr/share/zsh/site-functions/_btm"
}
