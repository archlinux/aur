# Maintainer: Adrian Fluturel <adrian.fluturel@protonmail.com>
pkgname=wolff-lang-git
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="This is the official bleeding-edge package for the Wolff language interpreter"
arch=(x86_64 i686)
url="https://github.com/Flu/wolff-lang.git"
license=('MIT')
groups=()
depends=()
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(wolff)
conflicts=(wolff)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/wolff" "target/release/wolff-lang"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
