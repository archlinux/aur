# Maintainer: Kyle Schreiber <kyle@80x24.net>

pkgname=kestrel
pkgver=1.0.0
pkgrel=1
pkgdesc="File encryption done right"
arch=("x86_64")
url=https://getkestrel.com
license=("BSD")
depends=("gcc-libs")
makedepends=("rust")
source=("kestrel-${pkgver//_/-}.tar.gz::$url/releases/v${pkgver//_/-}/kestrel-${pkgver//_/-}.tar.gz")
sha256sums=("83fc5dc6a487cefc1ef3c9d07b60193c1292b5988afe05d9ed11c98e68a871da")

build() {
    cd kestrel-${pkgver//_/-}
    cargo build --release --locked
}

check() {
    cd kestrel-${pkgver//_/-}
    cargo test --workspace --locked
}

package() {
    cd kestrel-${pkgver//_/-}
    install -D -m=755 target/release/kestrel "$pkgdir"/usr/bin/kestrel
    install -D -m=644 completion/kestrel.bash-completion "$pkgdir"/usr/share/bash-completion/completions/kestrel
    install -D -m=644 docs/man/kestrel.1 "$pkgdir"/usr/share/man/man1/kestrel.1
    install -D -m=644 LICENSE.txt "$pkgdir"/usr/share/licenses/kestrel/LICENSE.txt
    install -D -m=644 THIRD-PARTY-LICENSE.txt "$pkgdir"/usr/share/licenses/kestrel/THIRD-PARTY-LICENSE.txt
}
