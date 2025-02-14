# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("$pkgname-$pkgver-linux-x86_64::https://github.com/pol-rivero/doot/releases/download/0.0.11/doot-linux-x86_64")
sha256sums_x86_64=('85f4eb2544fc9322bb31ff8423d87c93e7fd07131a5532e38c8df3cff05cdd01')
source_aarch64=("$pkgname-$pkgver-linux-arm64::https://github.com/pol-rivero/doot/releases/download/0.0.11/doot-linux-arm64")
sha256sums_aarch64=('170a92f8bff3d4b3d784d08ba3c68c69e34654820b101864103c2838fb8243c4')

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
