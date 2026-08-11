# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=aeosd
pkgver=0.3.0
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
sha256sums=("8ecc7721779f22bc0b886009a415022212f2eca1d6580382a3ac932c986d7714")

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
