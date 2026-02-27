# Maintainer: Guru <anjanaya@gmail.com>
pkgname=enject
pkgver=0.2.0alpha
pkgrel=1
pkgdesc="Hide .env secrets from AI agents. Encrypted local store with runtime injection."
arch=('x86_64')
url="https://github.com/GreatScott/enject"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GreatScott/enject/archive/refs/tags/v0.2.0-alpha.tar.gz")
sha256sums=('42fd447c1bf622e1775888b99330bbc9f3f0fe9224b3a943a623f136f032d436')

prepare() {
    cd "${pkgname}-0.2.0-alpha"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-0.2.0-alpha"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-0.2.0-alpha"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
