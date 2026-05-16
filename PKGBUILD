# Maintainer: Zhiyu Huang <zhiyuh@ccat.dev>
# Contributor: Crush <crush@ccat.dev>

pkgname=ccat-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Enhanced cat tool — auto-detect and display markdown, docx, images, and gz files"
arch=('x86_64' 'aarch64')
url="https://github.com/zhiyuHD/ccat"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhiyuHD/ccat/archive/v$pkgver.tar.gz")
sha256sums=('622c8b7d6a2c40c7b7e1440f3673b120bde321ca10a3f7969f88336c78e0c355')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_BUILD_JOBS=$(nproc)
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ccat "$pkgdir/usr/bin/ccat"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
