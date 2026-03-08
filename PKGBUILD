# Maintainer: fibsussy <noahlykins@gmail.com>
pkgname=tmux-leap
pkgver=1.9.3
pkgrel=1
pkgdesc="tmux leaper, fzf through a list of projects or directories, autosessionizing, history"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/tmux-leap"
license=('MIT')
depends=('fzf' 'tmux')
makedepends=()
options=('!debug')
install=$pkgname.install

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/fibsussy/tmux-leap/releases/download/v${pkgver}/tmux-leap-linux-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fibsussy/tmux-leap/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP') 

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    "$srcdir/$pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$srcdir/$pkgname" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$srcdir/$pkgname" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
