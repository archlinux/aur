# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=aedle
pkgver=1.0.0
pkgrel=1
pkgdesc="An idle management daemon for wayland, written in Rust"
arch=("any")
url="https://git.sr.ht/~aeldit/aedle"
license=("GPL-2.0-only")
depends=(
    glibc
    gcc-libs
)
makedepends=(cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("f6685a5bb17f2f0ce3af8c96d5b1c1ab050ec6ecc723643cfb748b42412cebe2")

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
