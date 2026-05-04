# Maintainer: VanHoney-ltd <stygionevidencesystems@gmail.com>
pkgname=ionscout
pkgver=0.1.0
pkgrel=1
pkgdesc="Async LAN reconnaissance tool — NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/VanHoney-ltd/ionscout"
license=('MIT')
makedepends=('rust' 'cargo')
optdepends=('arping: for active ARP probing')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ec0fbeea0b14f47035b7d8df4f24abaf80552f284d431f7dd17a3213deb8918')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ionscout "$pkgdir/usr/bin/ionscout"
    for verb in scan discover watch sniff hunt peek; do
        ln -sf ionscout "$pkgdir/usr/bin/$verb"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
