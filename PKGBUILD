# Maintainer: novica <nnovica@gmail.com>

pkgname=q2
pkgver=0.10.0 # renovate: datasource=github-releases depName=quarto-dev/q2
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

sha512sums=('c55c02b404f8ad991bcdb846e0745acbd8ff83be223b527c795b0c5d75780bf59eae949070778d67d77e4bfd8cf13ad1f81afdefc800407200367fee4ef9c779')
