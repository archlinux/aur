# Maintainer: Shempignon < echo "bmljb2xhc0Bwb2ludG5kb3RzLmNvbQo=" | base64 -d >
# Contributor: https://github.com/shempignon/scaramanga/graphs/contributors

pkgname=scaramanga
pkgver=0.3.0
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
sha512sums=('44680c0c0af8d0794b0c30904004d1a2e3603f422a46f0eed232711b3a07c3c37b887f31b513ffd221a5e6829910a5c81b06821d054f713f0ec890f6c6d95de6')

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
