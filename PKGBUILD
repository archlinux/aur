# Maintainer: Shempignon < echo "bmljb2xhc0Bwb2ludG5kb3RzLmNvbQo=" | base64 -d >
# Contributor: https://github.com/shempignon/scaramanga/graphs/contributors

pkgname=scaramanga
pkgver=0.2.2
pkgrel=1
pkgdesc='Pacman Mirrorlist generator wrapper written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/shempignon/scaramanga"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/shempignon/scaramanga/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/scaramanga/config.toml")
sha512sums=("8d93bc90e912471415c079412b0c2112211f9b54760f654e468093ace707dd39ad5e68d7b238be54c8b9db8d26e5a7fe455bb466e273a752e0869b413b3de70b")

pkgver() {
    cd "${srcdir}/scaramanga"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/scaramanga"

    cargo build --release --locked
}

package() {
    cd "${srcdir}/scaramanga"

    install -Dm755 target/release/scaramanga "${pkgdir}/usr/bin/scaramanga"
    install -Dm755 config.toml.dist "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
