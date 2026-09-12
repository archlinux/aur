# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=magmax
pkgver=1.4.0
pkgrel=1
pkgdesc="Enhance genome recovery across metagenomic assemblies, from dereplication to enrichment"
arch=('x86_64')
url="https://github.com/soedinglab/MAGmax"
license=('GPL-3.0-only')
makedepends=('cargo')
conflicts=('magmax-bin')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53d4736c656c0570d27ce4dccee4dc6f76e00947c4a34327f9a098b39fa6ade8')

build() {
    cd "$srcdir/MAGmax-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/MAGmax-$pkgver"
    install -Dm755 "$srcdir/target/release/magmax" "$pkgdir/usr/bin/magmax"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
