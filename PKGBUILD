# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=hackernews_tui
_gitname=hackernews-TUI
pkgver=0.10.2
pkgrel=1
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
optdepends=('mercury-parser: to view articles directly in the terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/hackernews-TUI/archive/v$pkgver.tar.gz")
sha512sums=('bfd896bcdde4f9ee3cebb1dc0fdde0bdb23955a3f286a81c8a7237bd5ca34dcac3664743f1ba43202d7e286fd873d93b67eb3f6116d6a708c1fecbc0568b0841')

build() {
    cd "${_gitname}-$pkgver"

    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "${_gitname}-$pkgver"

    cargo test --release --locked --target-dir=target
}

package() {
    cd "${_gitname}-$pkgver"

    install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
