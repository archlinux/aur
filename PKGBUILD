pkgname=dam
pkgver=0.6.2
pkgrel=1
pkgdesc="Developer CLI for tracking, snapshotting, and restoring project state"
arch=('x86_64')
url="https://github.com/OneAM-Labs/dam"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OneAM-Labs/dam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41544c6c3f0d074088364989f9fb39ab4ef15ce111f9202d284b95d2a3ba00fd')

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
