# Maintainer: Massimiliano Torromeo <mtorromeo@archlinux.org>

pkgname=intentrace
pkgver=0.4.2
pkgrel=1
pkgdesc='strace with intent, it goes all the way for you instead of half the way'
arch=('x86_64')
url='https://github.com/sectordistrict/intentrace'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("https://github.com/sectordistrict/intentrace/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8cba3cfcafd0e16e02cd2bca0666f31667da36d6fac60eed7afff6f46940f948')

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
