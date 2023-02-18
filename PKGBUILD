# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.17
pkgrel=1

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('rustup')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e638b073fe765570a8c6ab1a20c9ff2492c235c24a0b16d9bc1d4d57432a0e81')

build() {
    cd "$pkgname-$pkgver"
    rustup toolchain install nightly
    cargo +nightly build --release --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
