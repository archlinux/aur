# Maintainer: Kawaki <dev at kanjala dot com>
pkgname=utd
pkgver=0.1.2
pkgrel=1
makedepends=('cargo')
url=https://github.com/kawaki-san/utd-rs
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Create and manage activities and notes offline in your terminal"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
license=('MIT/Apache-2.0')
md5sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    cp target/utd.1 "${pkgdir}/usr/share/man/man1"
}
