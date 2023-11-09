# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=hackernews_tui
_gitname=hackernews-TUI
pkgver=0.13.4
pkgrel=1
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
optdepends=('mercury-parser: to view articles directly in the terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/hackernews-TUI/archive/v$pkgver.tar.gz")
sha512sums=('0663fac2b9967d491510cd22e541b070138b1b7ba0b953591a6b0411e208c0549817616e0415f4f70befd3c185a755375de79e61cc9f65d52014ab4ee4aee95a')
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
