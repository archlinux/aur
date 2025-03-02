# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=cot
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
groups=()
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
noextract=()
md5sums=('6ccf0eb372f29ed022a1ca294de091ae')
validpgpkeys=()

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
    cd "$pkgname-cot-cli-v$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-cot-cli-v$pkgver"

    cargo build --frozen --release --all-features --target-dir target --bin cot
}

check() {
    return 0
}

package() {
    cd "$pkgname-cot-cli-v$pkgver"

    install -Dm 755 target/release/cot -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
