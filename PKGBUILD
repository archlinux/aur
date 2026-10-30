# Maintainer: novica <nnovica@gmail.com>

pkgname=q2
pkgver=0.39.0 # renovate: datasource=github-releases depName=quarto-dev/q2
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

sha512sums=('6caecd1fc3a8d7b14e594850a39a49285b19ca4e0faae9f0d6ab992f7b1194b18cc54a921060d5d055d00333a489e7c15a1d9a1f361b075c45bc28cd3cb49c5b')
