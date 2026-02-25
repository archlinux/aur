# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=parqeye
pkgver=0.0.2
pkgrel=1
pkgdesc='Peek inside Parquet files right from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kaushiksrini/parqeye'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('parqeye')
conflicts=('parqeye-bin')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/parqeye "${pkgdir}/usr/bin/parqeye"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
