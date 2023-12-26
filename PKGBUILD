pkgname=hath-rust
pkgdesc="Hentai@Home but rusty"
pkgver=1.1.0
pkgrel=1
arch=("x86_64")
url="https://github.com/james58899/hath-rust"
license=("GPL3")
options=("!lto") # https://github.com/briansmith/ring/issues/1444
makedepends=("cargo")
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "hath-rust.service"
    "hath-rust.tmpfiles"
    "hath-rust.sysusers"
)
sha256sums=('4ea70d90a9262494cf8c12b2ce9696d191474df5d5bc301816b9a475845ad4e3'
            '5d2234eb0d842260a63bcb3e6d75270cbda06b2d5b26046d279063f74c059f54'
            'c8723c66c17d9fe289bb6bbbf6cfb662a8e67c3d7ca6f4d3dd27bd675eff6df5'
            '28b78e349e96777177e6f95f078c3d09fec0dcd174b1a70d5dc9b18e309b0a81')

build() {
    cd "$srcdir/hath-rust-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/hath-rust-$pkgver"
    install -Dm755 "target/release/hath-rust" \
        "$pkgdir/usr/bin/hath-rust"
    install -Dm644 "$srcdir/hath-rust.service" \
        "$pkgdir/usr/lib/systemd/system/hath-rust.service"
    install -Dm644 "$srcdir/hath-rust.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/hath-rust.conf"
    install -Dm644 "$srcdir/hath-rust.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/hath-rust.conf"
}
