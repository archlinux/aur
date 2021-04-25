# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=hackernews_tui
_gitname=hackernews-TUI
pkgver=0.5.1
pkgrel=1
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/hackernews-TUI/archive/v$pkgver.tar.gz")
sha512sums=('084fcbf34cdc48bba9f21a526012e440ba9b51ec05781d2c3cf23efe89122e53bdc3dc5f76443ab608c6c159356c7ab965f0662325ac864af19dbf34e7873c7b')

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
