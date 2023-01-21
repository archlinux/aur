# Maintainer: Kyle Schreiber <kyle@80x24.net>

pkgname=kestrel
pkgver=0.10.1
pkgrel=2
pkgdesc="File encryption done right"
arch=("x86_64")
url=https://github.com/finfet/kestrel
license=("BSD")
depends=("gcc-libs")
makedepends=("rust")
source=("kestrel-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("1f69fb546bb87431ea3cde80accee1909f40dab2cd2b82f2f1bbf11eb5baf21c")

build() {
    cd kestrel-$pkgver
    cargo build --release --locked
}

check() {
    cd kestrel-$pkgver
    cargo test --workspace --locked
}

package() {
    cd kestrel-$pkgver
    install -D -m=755 target/release/kestrel "$pkgdir"/usr/bin/kestrel
    install -D -m=644 completion/kestrel.bash-completion "$pkgdir"/usr/share/bash-completion/completions/kestrel
    install -D -m=644 docs/man/kestrel.1 "$pkgdir"/usr/share/man/man1/kestrel.1
    install -D -m=644 LICENSE.txt "$pkgdir"/usr/share/licenses/kestrel/LICENSE.txt
    install -D -m=644 THIRD-PARTY-LICENSE.txt "$pkgdir"/usr/share/licenses/kestrel/THIRD-PARTY-LICENSE.txt
}
