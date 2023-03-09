# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.19
pkgrel=1

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('rustup')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b8a66f6744feac8a4f03d0c023ed03704ca1c44e011dbd800caa367c87abd67d')

build() {
    cd "$pkgname-$pkgver"
    rustup toolchain install nightly
    cargo +nightly build --release --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
