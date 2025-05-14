# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=v0.4.4
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/doot/releases/download/v0.4.4/doot-linux-x86_64")
sha256sums_x86_64=('ab1c4b64c75d62301c5bf51a8d6f29f2133dfceb831a7f88b784548f5c8714fb')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/doot/releases/download/v0.4.4/doot-linux-arm64")
sha256sums_aarch64=('88c1131a879e84f45c5b2053ce423395eb560ea4d2d40a25bef2598016eed604')

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
