# Maintainer: Rémy Marquis <https://github.com/rmarquis>
_pkgname=aurodle
pkgname=$_pkgname-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="An AUR helper that builds packages into a local repository"
arch=('x86_64')
url="https://github.com/rmarquis/aurodle"
license=('MIT')
depends=('git' 'pacman')
makedepends=('zig')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/rmarquis/aurodle.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname"

    install -Dm755 "zig-out/bin/aurodle" "$pkgdir/usr/bin/aurodle"

    install -Dm644 "completions/aurodle.bash" \
        "$pkgdir/usr/share/bash-completion/completions/aurodle"

    install -Dm644 "completions/aurodle.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/aurodle.fish"

    install -Dm644 "completions/aurodle.zsh" \
        "$pkgdir/usr/share/zsh/site-functions/_aurodle"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/aurodle/LICENSE"
}
