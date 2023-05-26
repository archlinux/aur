# Maintainer: Shempignon < echo "bmljb2xhc0Bwb2ludG5kb3RzLmNvbQo=" | base64 -d >
# Contributor: https://github.com/shempignon/scaramanga/graphs/contributors

pkgname=scaramanga
pkgver=0.3.2
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
sha512sums=('d5830ea75dbe9d9d388d003415a6c783897081c53c77df1027893a56eed599b6a1dd79eab7cab855757adbea4f4f1aa7fa60173d14c5e6a1f62fb0e57c9fa48e')

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
