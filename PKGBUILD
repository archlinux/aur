# Maintainer: novica <nnovica@gmail.com>

pkgname=q2
pkgver=0.21.0 # renovate: datasource=github-tags depName=quarto-dev/q2
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

sha512sums=('e18c677b8c2682a212fee99d2f62b30616dae61ddfbfd66117d30c2af2e9c7f207266886f7750632374cb99866a1e8e48502c317bff59c69200470dfd0f4061f')
