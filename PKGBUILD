# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=bazelrc-lsp
pkgver=0.2.5
pkgrel=1
pkgdesc="Bazelrc language server"
arch=('x86_64')
url="https://github.com/salesforce-misc/bazelrc-lsp"
license=('Apache-2.0')
groups=()
depends=(
    "bazelisk"
)
makedepends=(
    "cargo"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "git+${url}#tag=v${pkgver}"
)
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "LICENSE"
}

