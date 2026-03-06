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
sha256sums=('09bd7f7caa8451fad78a33efce9f3b368c614b2893866f57e27baa7ccd183382')
prepare() {
    cd "ResonanceID-cli-$pkgver"
    cargo fetch --locked
}
build() {
    cd "ResonanceID-cli-$pkgver"
    cargo build --release --locked
}
check() {
    cd "ResonanceID-cli-$pkgver"
    cargo test --release --locked
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

