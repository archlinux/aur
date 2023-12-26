pkgname=hath-rust
pkgdesc="Hentai@Home but rusty"
pkgver=1.1.0
pkgrel=2
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
            'f427254389f172d55c2ce52c635a8ab0f683d1c8373df497590519db69b1c813'
            '4732b0b6683df5734e652e3d8c5875d90d48577cc46e579bdf43e656d3ca216e'
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
