# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=aeosd
pkgver=0.1.0
pkgrel=1
pkgdesc="An OSD for changing screen brightness"
arch=("any")
url="https://git.sr.ht/~aeldit/aeosd"
license=("GPL-2.0-only")
depends=(
    glibc
    gcc-libs
)
makedepends=(cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("c95e0abb1c6eea15b5d1c8b7fed59b314cd698215656eee7caa7bab3b79b35a8")

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
