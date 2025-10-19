# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="A fast, simple and intuitive dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-linux-x86_64")
sha256sums_x86_64=('3ce2de5b09534492b06ce094af67f97006a3895c90662e93f93272462785b7df')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-linux-arm64")
sha256sums_aarch64=('49b1b2c2ca2ffd2641d67abf488de0bf8fbe92b27a40a969041c2dc31b1a6d6d')

package() {
    # Install binary
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/doot" completion bash > "$pkgdir/usr/share/bash-completion/completions/doot"
    "$pkgdir/usr/bin/doot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_doot"
    "$pkgdir/usr/bin/doot" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/doot.fish"
}
