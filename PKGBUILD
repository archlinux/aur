pkgname=dam
pkgver=0.6.0
pkgrel=1
pkgdesc="Developer CLI for tracking, snapshotting, and restoring project state"
arch=('x86_64')
url="https://github.com/OneAM-Labs/dam"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OneAM-Labs/dam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af5473a2683bc007f74678ef1d3d65bfaac622b87eba65d4f30bbffa8204c955')

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
