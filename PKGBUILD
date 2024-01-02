# Maintainer: Shempignon < echo "bmljb2xhc0Bwb2ludG5kb3RzLmNvbQo=" | base64 -d >
# Contributor: https://github.com/shempignon/scaramanga/graphs/contributors

pkgname=scaramanga
pkgver=0.3.3
pkgrel=1
pkgdesc='Pacman Mirrorlist generator wrapper written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/shempignon/scaramanga"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/shempignon/scaramanga/archive/refs/tags/v$pkgver.tar.gz")
backup=("etc/scaramanga/config.toml")
sha512sums=('67a32cda58574f1eb09d23181dd8de8391ee77eb2ed4e4e6a47aa2b09c70798bd4722ebc8ee6a37e4571ebbb038a09c87157fec3194bf7dbce98369c387d8f35')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/scaramanga "${pkgdir}/usr/bin/scaramanga"
    install -Dm755 config.toml.dist "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
