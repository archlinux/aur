# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=piri
pkgname=${_pkgname}-asthestarsfalll
pkgver=0.1.8
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
sha256sums=('bb6f6d5429ab2f32cce6f33ca930a4033b32b5b8199bd96e31fc04977b856d27')

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
    install -Dm644 "docs/en/plugins/edge_pulse.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/edge_pulse.md"
    install -Dm644 "docs/en/plugins/empty.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/empty.md"
    install -Dm644 "docs/en/plugins/mark.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/mark.md"
    install -Dm644 "docs/en/plugins/plugins.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/plugins.md"
    install -Dm644 "docs/en/plugins/scratchpads.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/scratchpads.md"
    install -Dm644 "docs/en/plugins/singleton.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/singleton.md"
    install -Dm644 "docs/en/plugins/sticky.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/sticky.md"
    install -Dm644 "docs/en/plugins/swallow.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/swallow.md"
    install -Dm644 "docs/en/plugins/window_order.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/window_order.md"
    install -Dm644 "docs/en/plugins/window_rule.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/window_rule.md"
    install -Dm644 "docs/en/plugins/workspace_rule.md" "$pkgdir/usr/share/doc/${_pkgname}/plugins/workspace_rule.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
