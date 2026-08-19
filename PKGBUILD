# Maintainer: novica <nnovica@gmail.com>

pkgname=q2
pkgver=0.24.0 # renovate: datasource=github-tags depName=quarto-dev/q2
pkgrel=1
pkgdesc="Quarto 2 [experimental]"
url="https://github.com/quarto-dev/q2"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    glibc
    libgcc
)
conflicts=('q2-bin')
makedepends=(
    cmake
    libstdc++
    openssl
    rust )
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quarto-dev/q2/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/q2 "${pkgdir}/usr/bin/q2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('0c5173a981adf8cdc27a939aefd4e1e28239656a77e20ca75f61303cbdbc4c8d42c4ff1026cf5f507c8cbbb9eccc6ec769f5bb64464a01e410001acbce23cb23')
