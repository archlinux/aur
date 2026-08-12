# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/sqeel
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=sqeel-bin
_pkgname=sqeel
pkgver=0.7.0
pkgrel=1
pkgdesc="Vim-modal SQL client: TUI front-end for sqlx-backed connections with LSP-aware editing. (binary release)"
arch=('x86_64' 'aarch64')
url="https://sqeel.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('libxcb' 'gcc-libs')

source_x86_64=("sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0c6da70688f47bb443fc7a2e3eed12010c4b2d1b634376733fe19426e6329e72')
sha256sums_aarch64=('58947966af956a656e1e278f9e02bf7bb3305beb0db99c2b64fc7e3a6f1f4292')

package() {
    install -Dm755 "$srcdir/sqeel" "$pkgdir/usr/bin/sqeel"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Completions + man page: the binary embeds its own generators
    # (`--completions <shell>` / `--man`), so generate from the exact
    # artifact being packaged.
    "$srcdir/sqeel" --completions bash | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/bash-completion/completions/sqeel"
    "$srcdir/sqeel" --completions zsh | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/zsh/site-functions/_sqeel"
    "$srcdir/sqeel" --completions fish | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/fish/vendor_completions.d/sqeel.fish"
    "$srcdir/sqeel" --man | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/man/man1/sqeel.1"
}
