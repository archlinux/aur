pkgname=dam
pkgver=0.5.5
pkgrel=1
pkgdesc="Developer CLI for tracking, snapshotting, and restoring project state"
arch=('x86_64')
url="https://github.com/OneAM-Labs/dam"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OneAM-Labs/dam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4012475331b286ef16470d7d75642f6f2a6af03cf06c67debfecfc6ffab420bb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/dam "$pkgdir/usr/bin/dam"

    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
