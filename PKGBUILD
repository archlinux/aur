# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=piri
pkgname=${_pkgname}-asthestarsfalll
pkgver=0.1.4
pkgrel=1
pkgdesc="High-performance Niri extension tool built with Rust"
arch=(x86_64)
url="https://github.com/Asthestarsfalll/piri"
license=('MIT')
depends=('niri')
makedepends=(cargo)
provides=(${_pkgname})
conflicts=(${_pkgname}-git)
source=("${_pkgname}-$pkgver::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0a53214b03d9aede6415493b4063e424b358a6df87337bf468477e3f8db0806')

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "target/release/piri" "$pkgdir/usr/bin/piri"
    install -Dm644 "README.en.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "config.example.toml" "$pkgdir/usr/share/doc/${_pkgname}/config.example.toml"
    install -Dm644 "docs/en/window_matching.md" "$pkgdir/usr/share/doc/${_pkgname}/window_matching.md"
    install -Dm644 "docs/en/plugins/autofill.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/autofill.md"
    install -Dm644 "docs/en/plugins/empty.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/empty.md"
    install -Dm644 "docs/en/plugins/plugins.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/plugins.md"
    install -Dm644 "docs/en/plugins/scratchpads.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/scratchpads.md"
    install -Dm644 "docs/en/plugins/singleton.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/singleton.md"
    install -Dm644 "docs/en/plugins/window_order.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/window_order.md"
    install -Dm644 "docs/en/plugins/window_rule.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/window_rule.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
