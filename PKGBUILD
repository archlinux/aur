# Maintainer: Partha Pratim Gogoi 160270614+rugbedbugg@users.noreply.github.com
pkgname=resonanceid-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Shazam-style audio fingerprinting CLI that identifies songs from song clips"
arch=('x86_64')
url="https://github.com/rugbedbugg/ResonanceID-cli"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
optdepends=('ffmpeg: audio conversion for the import command')
backup=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('65ae505849ad38a05d5407daf0001187054a1a4ac33602f6ee6bd3f8fbf38f7e')
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

