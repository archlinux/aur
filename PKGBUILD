# Maintainer: novica <nnovica@gmail.com>

pkgname=q2
pkgver=0.26.0 # renovate: datasource=github-tags depName=quarto-dev/q2
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

sha512sums=('3198ab79d47fd7c4ce0f69284708839f9836a19c62a6976bd2bbdedb1a7634e078223df0258af1c03aca9f2f51fc45054196268bdac507b90fca6ca7f3e4ae7e')
