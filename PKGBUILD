# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=hackernews_tui
_gitname=hackernews-TUI
pkgver=0.13.2
pkgrel=3
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
optdepends=('mercury-parser: to view articles directly in the terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/hackernews-TUI/archive/v$pkgver.tar.gz")
sha512sums=('401139136c8dbc2c42284ac27037e70470ab089e523c93eb31f233274b0aadce59857084964a2e4e636cd30f4c2fa67bc380236f27bc36078c3424aea0cf48a2')
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)

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
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "docs/config.md"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" "examples/hn-tui.toml"
}
# vim:set ts=2 sw=2 et:
