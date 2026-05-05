# Maintainer: VanHoney-ltd <ghost@example.com>
pkgname=ionprobe
pkgver=0.1.1
pkgrel=1
pkgdesc="Async security reconnaissance scanner — powered by the NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/VanHoney-ltd/ionprobe"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('729d15f9f9480d33e9d03c681bc246dcc34609641c2023591517117a57455d4f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ionprobe "$pkgdir/usr/bin/ionprobe"
    for verb in probe audit strike watch; do
        ln -sf ionprobe "$pkgdir/usr/bin/$verb"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
