pkgname=bin-cpuflags-x86
pkgver=1.0.1
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('67d372b2d57b48f62c0e1cbdef76c61bfe5b733605e51619b6c9c1b77beb90bb')

prepare() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${srcdir}"
    cargo build --frozen --release
}

check() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${srcdir}"
    cargo test --frozen
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "release/${pkgname}"
}
