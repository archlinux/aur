# Maintainer: Massimiliano Torromeo <mtorromeo@archlinux.org>

pkgname=intentrace
pkgver=0.9.0
pkgrel=1
pkgdesc='strace with intent, it goes all the way for you instead of half the way'
arch=('x86_64')
url='https://github.com/sectordistrict/intentrace'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("https://github.com/sectordistrict/intentrace/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1793f0e6e0c6078992e804993a652d2c0dc1cf948f205a3a91f4852ba7bd9cf5')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch
}

build() {
    cd $pkgname-$pkgver
    RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo build --frozen --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 target/release/intentrace "$pkgdir/usr/bin/intentrace"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
