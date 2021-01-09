# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=oled_shmoled
pkgver=0.1.3
pkgrel=2
pkgdesc="OLED displays don't have backlights but it'd be nice if we could pretend they do on Linux!"
arch=('x86_64')
url="https://github.com/NickGeek/oled-shmoled"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=(
    $pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate
)
md5sums=('63c23d971efd9f1beed107d18fbe2a76')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
