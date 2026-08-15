# Maintainer: Douglas Soares de Andrade <contato@douglasandrade.com>
pkgname=kefctl
pkgver=0.7.0
pkgrel=1
pkgdesc='TUI controller for KEF W2 speakers (LSX II, LS50 Wireless II, LS60 Wireless)'
arch=('x86_64')
url='https://github.com/douglas/kefctl'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('147a1f5b082154eb386efd29b6ac23e7c0829c0aea7e59e09df0b431efb99d73')

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
