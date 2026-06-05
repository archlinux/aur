# Maintainer: Sienna <i@kals.dev>
pkgname=vollminputd-git
pkgver=0.1.0.3.g9c81bba
pkgrel=1
pkgdesc="LLM-based voice input method for Linux Wayland"
arch=('x86_64')
url="https://github.com/ad2248/vollminputd"
license=('Apache-2.0')
depends=('wl-clipboard' 'openssl')
makedepends=('rust' 'cargo' 'git')
source=("vollminputd::git+https://github.com/ad2248/vollminputd.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vollminputd"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' || echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/vollminputd"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/vollminputd"
    install -Dm755 "target/release/vollminputd" "${pkgdir}/usr/bin/vollminputd"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
