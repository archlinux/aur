# Maintainer: Wiktor Kwapisiewicz <wiktor@metacode.biz>

pkgname=pks-openpgp-card-git
pkgver=0.1
pkgrel=1
license=('LGPL')
url="https://gitlab.com/sequoia-pgp/pks-openpgp-card"
arch=('x86_64')
makedepends=(cargo)
source=("pks-openpgp-card::git+https://gitlab.com/sequoia-pgp/pks-openpgp-card")
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
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "contrib/${pkgname%-git}.socket"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "contrib/${pkgname%-git}.service"
}
