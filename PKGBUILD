# Maintainer: VanHoney-ltd <stygionevidencesystems@gmail.com>
pkgname=ionsource
pkgver=0.1.0
pkgrel=1
pkgdesc="Source code security scanner — NEMESIS ENGINE"
arch=('x86_64' 'aarch64')
url="https://github.com/VanHoney-ltd/ionsource"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b98bc0b739251a27843e9efe19ffc79ea0e201dc8b5e87255640d8829981d273')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ionsource "$pkgdir/usr/bin/ionsource"
    for verb in scan audit watch hunt peek; do
        ln -sf ionsource "$pkgdir/usr/bin/$verb"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
