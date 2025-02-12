# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/0.0.7/doot-linux-x86_64")
sha256sums_x86_64=('089db765a0487ae0d87b54471e16a9d1a6e632167c5a6a9bf8fb5f06aab69eb4')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/0.0.7/doot-linux-arm64")
sha256sums_aarch64=('c4602881e9550c7f81834cd82d05d0154dd95d7da3c2ba71036132b69d4969df')

package() {
    # Install binary
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/doot" completion bash > "$pkgdir/usr/share/bash-completion/completions/doot"
    "$pkgdir/usr/bin/doot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_doot"
    "$pkgdir/usr/bin/doot" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/doot.fish"
}
