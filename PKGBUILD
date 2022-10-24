# Maintainer: Kyle Schreiber <kyle@80x24.net>

pkgname=kestrel
pkgver=0.10.0
pkgrel=1
pkgdesc="File encryption done right"
arch=("x86_64")
url=https://github.com/finfet/kestrel
license=("BSD")
depends=("gcc-libs")
makedepends=("rust")
source=("kestrel-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("8144ccc9272b7bdd0a85488715d93e5c9ab8d234acdfefd93c80ee8b5360bd1e")

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
