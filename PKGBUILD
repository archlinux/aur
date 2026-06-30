pkgname=mcsh
pkgver=0.1.3
pkgrel=1
pkgdesc="A Minecraft-inspired Linux shell written in Rust"
arch=('x86_64')
url="https://github.com/Tamim180/mcsh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tamim180/mcsh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a90aa64f166e9023e8ac1dcf56679a68303ad67ad4672763936d9294a7c387c3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/mcsh "$pkgdir/usr/bin/mcsh"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    if [[ -f README.md ]]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
