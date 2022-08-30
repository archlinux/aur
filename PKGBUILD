# Maintainer: Adrian Fluturel <adrian.fluturel@protonmail.com>
pkgname=wolff-lang-git
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="This is the official bleeding-edge package for the Wolff language interpreter"
arch=(x86_64 i686)
url="https://github.com/Flu/wolff-lang.git"
license=('MIT')
groups=()
depends=(gcc-libs)
makedepends=(cargo git)
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
    cd wolff-lang
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd wolff-lang
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd wolff-lang
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features
}

package() {
    cd wolff-lang
    install -Dt "$pkgdir/usr/bin/" target/release/wolff
    install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
}
