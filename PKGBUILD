# Maintainer: ghost <ghost@example.com>
pkgname=fafinder
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, verb-driven file finder — powered by the NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/ghost/fafinder"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('86e6adbba1eb41065d618e32746e19e4223870986ad833a4de7d345b3a8420e8')

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
