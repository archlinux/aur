# Maintainer: Cyridge cyridge@proton.me
pkgname=rsv-ng
pkgver=r1.0
pkgrel=1
pkgdesc="A runit service manager with smart completions, scaffolding, and more"
arch=('any')
url="https://gitlab.com/runit-rsv/rsv-main"
license=('GPL2')
depends=('runit')
makedepends=('git')
provides=('rsv')
conflicts=('rsv')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 rsv      "$pkgdir/usr/bin/rsv"
    install -Dm644 rsv.bash "$pkgdir/usr/share/bash-completion/completions/rsv"
    install -Dm644 rsv.fish "$pkgdir/usr/share/fish/vendor_completions.d/rsv.fish"
    install -Dm644 rsv.zsh  "$pkgdir/usr/share/zsh/site-functions/_rsv"
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}