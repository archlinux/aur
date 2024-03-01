# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>

pkgname=feroxbuster
pkgver=2.10.2
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
arch=('any')
url="https://github.com/epi052/feroxbuster"
license=("MIT")
makedepends=("git" "cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/epi052/feroxbuster/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c73d26f21431c5dad77b6910471f768df5b27d5486b276f328f2d370d1c57003')

build() {
    cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "target/release/feroxbuster" "${pkgdir}/usr/bin/feroxbuster"

    install -Dm644 "shell_completions/feroxbuster.fish" "$pkgdir/usr/share/fish/vendor_completions.d/feroxbuster.fish"
    install -Dm644 "shell_completions/_feroxbuster"     "$pkgdir/usr/share/zsh/site-functions/_feroxbuster"
    install -Dm644 "shell_completions/feroxbuster.bash" -t "$pkgdir/usr/share/bash-completion/completions/"
}
