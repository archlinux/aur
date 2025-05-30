# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="A fast, simple and intuitive dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-linux-x86_64")
sha256sums_x86_64=('4b4291c52d6884e1ac50dff032fa8e1e0e22d14d5877d9bd23d1a8acf2bda72e')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-linux-arm64")
sha256sums_aarch64=('5b3a92a0bb3d52d03ba77239ac20a695d315e320f03c27d8b65a9be48f737763')

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
