# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=kefctl
pkgver=0.5.1
pkgrel=1
pkgdesc='TUI controller for KEF W2 speakers (LSX II, LS50 Wireless II, LS60 Wireless)'
arch=('x86_64')
url='https://github.com/douglas/kefctl'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d239f5d5d50b1f28b0710d220e057d3286c67744aa76447fd9b39014e04054fb')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/kefctl "$pkgdir/usr/bin/kefctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
