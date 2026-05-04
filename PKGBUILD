# Maintainer: VanHoney-ltd <ghost@example.com>
pkgname=fafinder
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, verb-driven file finder — powered by the NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/VanHoney-ltd/fafinder"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('381026140d4f2e97eb33448190f588e0e2b91eb3556facee8e073df51df7248b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/fafinder "$pkgdir/usr/bin/fafinder"
    for verb in scan look hunt dig seek peek; do
        ln -sf fafinder "$pkgdir/usr/bin/$verb"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
