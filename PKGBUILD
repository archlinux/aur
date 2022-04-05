# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=feroxbuster
pkgver=2.6.1
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
arch=('any')
url="https://github.com/epi052/feroxbuster"
license=("MIT")
makedepends=("git" "cargo")
source=("${pkgname}-${pkgver}::https://github.com/epi052/feroxbuster/archive/refs/tags/v${pkgver}.zip")
sha256sums=('a9d1b7f09cdc7f6f7ae214a6af82a6d4d8201c801a9c9225ebc8921929be17ed')

build() {
    cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm755 "target/release/feroxbuster" "${pkgdir}/usr/bin/feroxbuster"

    install -Dm644 "shell_completions/feroxbuster.fish" "$pkgdir/usr/share/fish/vendor_completions.d/feroxbuster.fish"
    install -Dm644 "shell_completions/_feroxbuster"     "$pkgdir/usr/share/zsh/site-functions/_feroxbuster"
    install -Dm644 "shell_completions/feroxbuster.bash" -t "$pkgdir/usr/share/bash-completion/completions/"
}
