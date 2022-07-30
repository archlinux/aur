# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=bdf
pkgver=1.0.0
pkgrel=1
pkgdesc='Btrfs Duplicate Finder'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9b5dec9ead1831a19762d1448d01bccc32c752e1b1224ee14604a609e7017985c36b64a37c6f185f851a86fea13c09637abb9757e4fd08ec79e734dc5123c05e')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
