# Maintainer: kirarahoshiiii
pkgname=fastfetch-configs-git
pkgver=r23.0cb154d
pkgrel=1
pkgdesc="A collection of ready-to-use aesthetic fastfetch configurations with an interactive installer"
arch=('any')
url="https://github.com/iamanuclearwarhead/fastfetch-configs"
license=('MIT')
depends=('fastfetch' 'bash')
makedepends=('git')
optdepends=('ttf-jetbrains-mono-nerd: icons in the nerd font themed configs')
provides=('fastfetch-configs')
conflicts=('fastfetch-configs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    local sharedir="$pkgdir/usr/share/fastfetch-configs"
    install -dm755 "$sharedir"
    local dir
    for dir in */; do
        if [ -f "$dir/config.jsonc" ]; then
            install -Dm644 "$dir/config.jsonc" "$sharedir/${dir%/}/config.jsonc"
        fi
    done

    install -Dm755 install.sh "$pkgdir/usr/bin/fastfetch-configs"

    install -Dm644 completions/fastfetch-configs.bash \
        "$pkgdir/usr/share/bash-completion/completions/fastfetch-configs"
    install -Dm644 completions/_fastfetch-configs \
        "$pkgdir/usr/share/zsh/site-functions/_fastfetch-configs"
    install -Dm644 completions/fastfetch-configs.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/fastfetch-configs.fish"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
