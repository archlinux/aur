# Maintainer: Massimiliano Torromeo <mtorromeo@archlinux.org>

pkgname=intentrace
pkgver=0.9.8
pkgrel=1
pkgdesc='strace with intent, it goes all the way for you instead of half the way'
arch=('x86_64')
url='https://github.com/sectordistrict/intentrace'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("https://github.com/sectordistrict/intentrace/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('02dd39003c2737e4cb7911945e91ea4aa7df4ef8e500b14f5ae9aa4f2cf85a7c')

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
