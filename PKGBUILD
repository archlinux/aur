# Maintainer: VanHoney-ltd <stygionevidencesystems@gmail.com>
pkgname=ionlog
pkgver=0.1.0
pkgrel=1
pkgdesc="Log analysis and anomaly detection — NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/VanHoney-ltd/ionlog"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('edacafef261108f09b32cc8276c09e65534f8fc28106fca2357f6b2a4d376ce6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ionlog "$pkgdir/usr/bin/ionlog"
    for verb in tail scan watch hunt peek; do
        ln -sf ionlog "$pkgdir/usr/bin/$verb"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
