# Maintainer: aik2 <aik2mlj at gmail dot com>

pkgname=emailbook-rs-bin
_name=emailbook
pkgver=0.4.0
pkgrel=1
pkgdesc='A minimalistic email address book with aerc integration'
arch=('x86_64')
url='https://github.com/aik2mlj/emailbook-rs'
license=('MIT')
depends=()
optdepends=(
    'bash-completion: bash completions'
    'zsh: zsh completions'
    'fish: fish completions'
)
provides=($_name)
conflicts=($_name)

source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1e86db37c93a373004a488cd3c6dce45b7d1c081eca75e0c255ee88af287f3fe')

package() {
    # install binary
    install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"

    # completion directories
    install -d \
        "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d"

    # generate completions
    "$pkgdir/usr/bin/$_name" completion bash >"$pkgdir/usr/share/bash-completion/completions/$_name"
    "$pkgdir/usr/bin/$_name" completion zsh >"$pkgdir/usr/share/zsh/site-functions/_$_name"
    "$pkgdir/usr/bin/$_name" completion fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
}
