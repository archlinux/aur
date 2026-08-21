# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=pqp-crypto
pkgver=0.1.0
pkgrel=1
pkgdesc='Quantum-resistant GPG emulation (ML-KEM + ML-DSA)'
arch=('x86_64' 'aarch64')
url='https://github.com/ajdiaz/pqp'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ajdiaz/pqp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc9a3c9997d18197113fb87814a20d3c2bea0069ca896ec7a3cb0c18ae9e4464')

build() {
    cd "$srcdir/pqp-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/pqp-$pkgver"
    cargo test --release --locked -- --test-threads=1
}

package() {
    cd "$srcdir/pqp-$pkgver"
    install -Dm755 "target/release/pqp" "$pkgdir/usr/bin/pqp"
    install -Dm644 "man/pqp.1" "$pkgdir/usr/share/man/man1/pqp.1"
    install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
sha256sums=('dc9a3c9997d18197113fb87814a20d3c2bea0069ca896ec7a3cb0c18ae9e4464')
