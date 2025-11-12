# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=starpls
pkgver=0.1.22
pkgrel=1
pkgdesc="An LSP implementation for Starlark"
arch=('x86_64')
url="https://github.com/withered-magic/starpls"
license=('Apache-2.0 AND MIT')
groups=()
depends=(
    "bazel"
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

    export REPOSITORY_NAME=${pkgname}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT" "LICENSE-MIT"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE" "LICENSE-APACHE"
}

