# Maintainer: Partha Pratim Gogoi 160270614+rugbedbugg@users.noreply.github.com
pkgname=resonanceid-cli
pkgver=0.8.2
pkgrel=1
pkgdesc="Shazam-style audio fingerprinting CLI that identifies songs from song clips"
arch=('x86_64')
url="https://github.com/rugbedbugg/ResonanceID-cli"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
backup=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1030164a7dab14f08d18c30279b9920fc56c1577b41707bc807061a2c20b292')
prepare() {
    cd "ResonanceID-cli-$pkgver"
    cargo fetch
}
build() {
    cd "ResonanceID-cli-$pkgver"
    cargo build --release
}
check() {
    cd "ResonanceID-cli-$pkgver"
    cargo test --release
}
package() {
    cd "ResonanceID-cli-$pkgver"

    # binary
    install -Dm755 target/release/resonanceid-cli "$pkgdir/usr/bin/resonanceid-cli"
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # readme
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

