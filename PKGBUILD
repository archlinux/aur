# Maintainer: kirarahoshiiii
pkgname=cellmate-git
pkgver=r3.b31b10f
pkgrel=1
pkgdesc="A tiny CLI to track your FPV battery fleet: cycles, internal resistance, flights, and puffy packs"
arch=('any')
url="https://github.com/iamanuclearwarhead/cellmate"
license=('MIT')
depends=('bash' 'gawk' 'coreutils')
makedepends=('git')
provides=('cellmate')
conflicts=('cellmate')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm755 cellmate "$pkgdir/usr/bin/cellmate"

    install -Dm644 completions/cellmate.bash \
        "$pkgdir/usr/share/bash-completion/completions/cellmate"
    install -Dm644 completions/_cellmate \
        "$pkgdir/usr/share/zsh/site-functions/_cellmate"
    install -Dm644 completions/cellmate.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/cellmate.fish"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
