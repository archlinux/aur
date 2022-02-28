# Maintainer: Wiktor Kwapisiewicz <wiktor@metacode.biz>

pkgname=minics-git
pkgver=0.1
pkgrel=1
pkgdesc="Miniature certificate store for OpenPGP"
license=('LGPL')
url="https://gitlab.com/wiktor/minics"
arch=('x86_64')
makedepends=(cargo git)
source=("git+https://gitlab.com/wiktor/minics")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "contrib/${pkgname%-git}.service"
}
