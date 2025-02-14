# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/0.0.8/doot-linux-x86_64")
sha256sums_x86_64=('46a21d6a2550748f40a0d6bc8435f610c938a4a5115802c2059802f8c0d27904')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/0.0.8/doot-linux-arm64")
sha256sums_aarch64=('82cfa8cf900046d43cbbec0f632bff59ac5f74f15ff3d537150213b3acba4322')

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
