# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.12
pkgrel=1

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('rustup')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('df7bcd85a838a79826dfba1773229741b0946f30ec9c92bbd41407b0ddda1152')

build() {
    cd "$pkgname-$pkgver"
    rustup toolchain install nightly
    cargo +nightly build --release --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
