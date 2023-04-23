# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=hackernews_tui
_gitname=hackernews-TUI
pkgver=0.12.0
pkgrel=2
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
optdepends=('mercury-parser: to view articles directly in the terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aome510/hackernews-TUI/archive/v$pkgver.tar.gz")
sha512sums=('dc2082f209cce891f068b0459f4fb2205013b3481e4eea6302a9cce23b105ede497ae3e5ead775fd8125e28f21a917b5d517b38436b5b3cb804cd388f50caebb')
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
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "doc/config.md"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" "examples/hn-tui.toml"
}
# vim:set ts=2 sw=2 et:
