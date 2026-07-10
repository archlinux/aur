# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=kefctl
pkgver=0.6.0
pkgrel=1
pkgdesc='TUI controller for KEF W2 speakers (LSX II, LS50 Wireless II, LS60 Wireless)'
arch=('x86_64')
url='https://github.com/douglas/kefctl'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('863df0548b9057e2211a643356d0f8494204ecd2ed5ba1630a8f66fbfc3bb465')

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
